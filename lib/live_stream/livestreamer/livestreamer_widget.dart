import '/backend/backend.dart';
import '/backend/cloud_functions/cloud_functions.dart';
import '/flutter_flow/flutter_flow_mux_broadcast.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'livestreamer_model.dart';
export 'livestreamer_model.dart';

class LivestreamerWidget extends StatefulWidget {
  const LivestreamerWidget({
    super.key,
    required this.streamName,
  });

  final String? streamName;

  @override
  State<LivestreamerWidget> createState() => _LivestreamerWidgetState();
}

class _LivestreamerWidgetState extends State<LivestreamerWidget> {
  late LivestreamerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? muxBroadcastPlaybackUrl;
  bool muxBroadcastIsLive = false;
  LiveStreamController? muxBroadcastController;
  final _initialAudioConfig = AudioConfig(
    channel: Channel.stereo,
  );
  final _initialVideoConfig = VideoConfig.withDefaultBitrate(
    resolution: Resolution.RESOLUTION_720,
  );
  // variables for managing camera states
  bool _isCameraInitialized = false;
  bool _isFrontCamSelected = false;
  final _stopwatch = Stopwatch();
  String? _durationString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LivestreamerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'livestreamer'});
    if (Platform.isAndroid || Platform.isIOS) {
      _initCamera();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _stopwatch.stop();
    _timer?.cancel();
    WakelockPlus.disable();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: FlutterFlowMuxBroadcast(
                    isCameraInitialized: _isCameraInitialized,
                    isStreaming: muxBroadcastIsLive,
                    durationString: _durationString,
                    borderRadius: BorderRadius.circular(24.0),
                    controller: muxBroadcastController,
                    videoConfig: _initialVideoConfig,
                    onCameraRotateButtonTap: () async {
                      await switchCamera();
                      safeSetState(
                          () => _isFrontCamSelected = !_isFrontCamSelected);
                    },
                    startButtonText: FFLocalizations.of(context).getText(
                      'a695uyz8' /* Start Stream */,
                    ),
                    startButtonIcon: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    startButtonOptions: FFButtonOptions(
                      width: 160.0,
                      height: 50.0,
                      color: FlutterFlowTheme.of(context).error,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    liveIcon: const FaIcon(
                      FontAwesomeIcons.solidCircle,
                      color: Colors.red,
                      size: 10.0,
                    ),
                    liveText: FFLocalizations.of(context).getText(
                      'tfuemznr' /* Live */,
                    ),
                    liveTextStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Inter',
                              color: Colors.red,
                              letterSpacing: 0.0,
                            ),
                    liveTextBackgroundColor: const Color(0x8A000000),
                    durationTextStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Inter',
                              color: Colors.red,
                              letterSpacing: 0.0,
                            ),
                    durationTextBackgroundColor: const Color(0x8A000000),
                    liveContainerBorderRadius: BorderRadius.circular(8.0),
                    durationContainerBorderRadius: BorderRadius.circular(8.0),
                    rotateButtonColor: const Color(0x8A000000),
                    rotateButtonIcon: const Icon(
                      Icons.flip_camera_android,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    stopButtonIcon: const Icon(
                      Icons.stop_rounded,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    stopButtonColor: Colors.red,
                    onStartButtonTap: () async {
                      await startStreaming();
                      logFirebaseEvent(
                          'LIVESTREAMER_MuxBroadcast_whrcyfub_ON_MU');
                      logFirebaseEvent('MuxBroadcast_backend_call');

                      var streamsRecordReference =
                          StreamsRecord.collection.doc();
                      await streamsRecordReference.set(createStreamsRecordData(
                        name: widget.streamName,
                        isLive: true,
                        url: muxBroadcastPlaybackUrl,
                        time: getCurrentTimestamp,
                      ));
                      _model.createdDoc = StreamsRecord.getDocumentFromData(
                          createStreamsRecordData(
                            name: widget.streamName,
                            isLive: true,
                            url: muxBroadcastPlaybackUrl,
                            time: getCurrentTimestamp,
                          ),
                          streamsRecordReference);

                      safeSetState(() {});
                    },
                    onStopButtonTap: () async {
                      stopStreaming();
                      logFirebaseEvent(
                          'LIVESTREAMER_MuxBroadcast_whrcyfub_ON_MU');
                      logFirebaseEvent('MuxBroadcast_backend_call');

                      await _model.createdDoc!.reference
                          .update(createStreamsRecordData(
                        isLive: false,
                      ));
                      logFirebaseEvent('MuxBroadcast_navigate_to');

                      context.pushNamed('Streams');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _initCamera() async {
    muxBroadcastController = initLiveStreamController();
    await muxBroadcastController!.create(
      initialAudioConfig: _initialAudioConfig,
      initialVideoConfig: _initialVideoConfig,
    );
    safeSetState(() => _isCameraInitialized = true);
  }

  LiveStreamController initLiveStreamController() {
    return LiveStreamController(
      onConnectionSuccess: () {
        print('Connection succeeded');
        safeSetState(() => muxBroadcastIsLive = true);
        _startTimer();
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        safeSetState(() {});
      },
      onDisconnection: () {
        print('Disconnected');
        safeSetState(() => muxBroadcastIsLive = false);
        _stopTimer();
      },
    );
  }

  Future<void> switchCamera() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      liveStreamController.switchCamera();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to switch camera: ${error.message}');
      } else {
        print('Failed to switch camera: $error');
      }
    }
  }

  Future<void> startStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    const streamBaseURL = 'rtmps://global-live.mux.com:443/app/';
    const callName = 'createLiveStream';
    final response =
        await makeCloudCall(callName, {'latency_mode': 'standard'});
    final streamKey = response['stream_key'];
    final playbackId = response['playback_ids'][0]['id'];
    muxBroadcastPlaybackUrl = 'https://stream.mux.com/$playbackId.m3u8';
    if (streamKey != null) {
      try {
        WakelockPlus.enable();
        await liveStreamController.startStreaming(
          streamKey: streamKey,
          url: streamBaseURL,
        );
      } catch (error) {
        if (error is PlatformException) {
          print("Error: failed to start stream: ${error.message}");
        } else {
          print("Error: failed to start stream: $error");
        }
      }
    }
  }

  Future<void> stopStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      WakelockPlus.disable();
      liveStreamController.stopStreaming();
      safeSetState(() => muxBroadcastIsLive = false);
      _stopTimer();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to stop stream: ${error.message}');
      } else {
        print('Failed to stop stream: $error');
      }
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      safeSetState(() {
        _durationString = _getDurationString(_stopwatch.elapsed);
      });
    });
  }

  void _stopTimer() {
    _stopwatch
      ..stop()
      ..reset();
    _durationString = _getDurationString(_stopwatch.elapsed);
    _timer?.cancel();
  }

  String _getDurationString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
