import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'livestream_viewer_model.dart';
export 'livestream_viewer_model.dart';

class LivestreamViewerWidget extends StatefulWidget {
  const LivestreamViewerWidget({
    super.key,
    this.url,
  });

  final String? url;

  @override
  State<LivestreamViewerWidget> createState() => _LivestreamViewerWidgetState();
}

class _LivestreamViewerWidgetState extends State<LivestreamViewerWidget> {
  late LivestreamViewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LivestreamViewerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'livestreamViewer'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

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
          child: FlutterFlowVideoPlayer(
            path: widget.url!,
            videoType: VideoType.network,
            autoPlay: false,
            looping: true,
            showControls: true,
            allowFullScreen: true,
            allowPlaybackSpeedMenu: true,
          ),
        ),
      ),
    );
  }
}
