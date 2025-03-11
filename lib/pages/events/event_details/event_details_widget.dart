import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/events/components/rsvp_component/rsvp_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'event_details_model.dart';
export 'event_details_model.dart';

class EventDetailsWidget extends StatefulWidget {
  /// Event detailed page to show a more descriptive information about an event
  const EventDetailsWidget({
    super.key,
    required this.eventDetail,
  });

  final TblEventsRecord? eventDetail;

  @override
  State<EventDetailsWidget> createState() => _EventDetailsWidgetState();
}

class _EventDetailsWidgetState extends State<EventDetailsWidget> {
  late EventDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EventDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EVENT_DETAILS_EventDetails_ON_INIT_STATE');
      logFirebaseEvent('EventDetails_update_page_state');
      _model.addToFriendsList(currentUserReference!);
      _model.isBookedMarked = widget.eventDetail?.isBookedMarked;
      safeSetState(() {});
      logFirebaseEvent('EventDetails_update_page_state');
      _model.addToFriendsList(widget.eventDetail!.eventOrganizerId!);
      safeSetState(() {});
      logFirebaseEvent('EventDetails_update_app_state');
      FFAppState().eventState = EventEntityStruct(
        eventReference: widget.eventDetail?.reference,
        eventName: widget.eventDetail?.name,
        startDate: widget.eventDetail?.startTime,
        endDate: widget.eventDetail?.endTime,
        eventOrganizerReference: widget.eventDetail?.eventOrganizerId,
        eventLocation: widget.eventDetail?.locationName,
        currencySymbol: widget.eventDetail?.currencySymbol,
        currency: widget.eventDetail?.currency,
      );
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Drawer(
            elevation: 16.0,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EVENT_DETAILS_PAGE_Icon_v6soxlk9_ON_TAP');
                                  logFirebaseEvent('Icon_drawer');
                                  if (scaffoldKey.currentState!.isDrawerOpen ||
                                      scaffoldKey
                                          .currentState!.isEndDrawerOpen) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 35.0,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'EVENT_DETAILS_PAGE_Row_e3uok0f2_ON_TAP');
                                logFirebaseEvent('Row_navigate_to');

                                context.pushNamed(
                                  'EditEvent',
                                  queryParameters: {
                                    'eventDetails': serializeParam(
                                      widget.eventDetail,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'eventDetails': widget.eventDetail,
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.edit_off,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'onmhs3kc' /* Edit Event */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 20.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EVENT_DETAILS_PAGE_Row_s7ltjbxf_ON_TAP');
                                  logFirebaseEvent('Row_backend_call');
                                  await widget.eventDetail!.reference.delete();
                                  logFirebaseEvent('Row_navigate_to');

                                  context.pushNamed('ProfileRedirectPage');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.add_home_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'kh8sylgo' /* Delete Event */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 20.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            ClipRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 1.0,
                  sigmaY: 0.0,
                ),
                child: StreamBuilder<List<TblEventImagesRecord>>(
                  stream: queryTblEventImagesRecord(
                    queryBuilder: (tblEventImagesRecord) =>
                        tblEventImagesRecord.where(
                      'event_id',
                      isEqualTo: widget.eventDetail?.reference,
                    ),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<TblEventImagesRecord>
                        backgroundContainerTblEventImagesRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final backgroundContainerTblEventImagesRecord =
                        backgroundContainerTblEventImagesRecordList.isNotEmpty
                            ? backgroundContainerTblEventImagesRecordList.first
                            : null;

                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            backgroundContainerTblEventImagesRecord!.imagePath,
                          ).image,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      FFAppConstants.safeArea.toDouble(),
                      0.0,
                    ),
                    0.0,
                    0.0),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 2.0,
                                    sigmaY: 2.0,
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0x43CDCED0),
                                      shape: BoxShape.circle,
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'EVENT_DETAILS_PAGE_BackButton_ON_TAP');
                                        logFirebaseEvent(
                                            'BackButton_navigate_to');

                                        context.pushNamed('Home');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 2.0,
                                    sigmaY: 2.0,
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0x30CDCED0),
                                      shape: BoxShape.circle,
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      buttonSize: 40.0,
                                      disabledIconColor:
                                          FlutterFlowTheme.of(context).grey2,
                                      icon: Icon(
                                        FFIcons.kkebabVertical,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: (widget.eventDetail
                                                  ?.eventOrganizerId !=
                                              currentUserReference)
                                          ? null
                                          : () async {
                                              logFirebaseEvent(
                                                  'EVENT_DETAILS_PAGE_KebabButton_ON_TAP');
                                              logFirebaseEvent(
                                                  'KebabButton_drawer');
                                              scaffoldKey.currentState!
                                                  .openDrawer();
                                            },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 400.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  FFAppConstants.sidePadding.toDouble(),
                                  0.0,
                                ),
                                0.0,
                                valueOrDefault<double>(
                                  FFAppConstants.sidePadding.toDouble(),
                                  0.0,
                                ),
                                0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50.0,
                                  child: Divider(
                                    thickness: 3.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.7,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.eventDetail?.name,
                                              'Shere Bangla Concert',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      size: 15.0,
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        widget.eventDetail
                                                            ?.locationName,
                                                        'ABC Avenue, Dhaka',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 20,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons
                                                            .calendar_month_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 15.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${dateTimeFormat(
                                                        "d",
                                                        widget.eventDetail
                                                            ?.startTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )} - ${dateTimeFormat(
                                                        "d MMMM y",
                                                        widget.eventDetail
                                                            ?.endTime,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 6.0)),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.25,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.04,
                                        decoration: BoxDecoration(
                                          color: const Color(0x4FF2672A),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '${widget.eventDetail?.currencySymbol}${formatNumber(
                                              widget.eventDetail?.price,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            )}${widget.eventDetail?.currency?.name}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${valueOrDefault<String>(
                                              widget.eventDetail!
                                                          .noOfUsersJoined <
                                                      5000
                                                  ? widget.eventDetail
                                                      ?.noOfUsersJoined
                                                      .toString()
                                                  : '5K+',
                                              '5K+',
                                            )} Members are joined',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8cHJvZmlsZSUyMHxlbnwwfHx8fDE3MzA4NzYzMTZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1506863530036-1efeddceb993?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNnx8cHJvZmlsZXxlbnwwfHx8fDE3MzA4NTUwMTN8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxwcm9maWxlJTIwfGVufDB8fHx8MTczMDk4NzUwNHww&ixlib=rb-4.0.3&q=80&w=1080',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        45.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxQcm9maWxlfGVufDB8fHx8MTczMDkzMDMxN3ww&ixlib=rb-4.0.3&q=80&w=1080',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        60.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget.eventDetail!
                                                                  .noOfUsersJoined <
                                                              5000
                                                          ? widget.eventDetail
                                                              ?.noOfUsersJoined
                                                              .toString()
                                                          : '5K+',
                                                      '5K+',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 9.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (widget
                                              .eventDetail?.eventOrganizerId ==
                                          currentUserReference)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'EVENT_DETAILS_PAGE_ViewAllText_ON_TAP');
                                            logFirebaseEvent(
                                                'ViewAllText_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: RsvpComponentWidget(
                                                      eventRef: widget
                                                          .eventDetail!
                                                          .reference,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'hl0j0sv3' /* VIEW ALL MEMBERS */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                    ].divide(const SizedBox(width: 1.0)),
                                  ),
                                ),
                                SizedBox(
                                  width: 350.0,
                                  child: Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                StreamBuilder<TblUsersRecord>(
                                  stream: TblUsersRecord.getDocument(
                                      widget.eventDetail!.eventOrganizerId!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final profilePictureRowTblUsersRecord =
                                        snapshot.data!;

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                alignment: const AlignmentDirectional(
                                                    1.0, 1.0),
                                                children: [
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      profilePictureRowTblUsersRecord
                                                          .photoUrl,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.04,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.04,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      profilePictureRowTblUsersRecord
                                                          .fullName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'sp1kngkg' /* Event Organiser */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 6.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (widget.eventDetail
                                                      ?.eventOrganizerId !=
                                                  currentUserReference)
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.15,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.15,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0x43CDCED0),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    buttonSize: 50.0,
                                                    icon: Icon(
                                                      Icons.wechat_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'EVENT_DETAILS_PAGE_MessageButton_ON_TAP');
                                                      // newChat
                                                      logFirebaseEvent(
                                                          'MessageButton_newChat');

                                                      var chatsRecordReference =
                                                          ChatsRecord.collection
                                                              .doc();
                                                      await chatsRecordReference
                                                          .set({
                                                        ...createChatsRecordData(
                                                          userA:
                                                              profilePictureRowTblUsersRecord
                                                                  .reference,
                                                          userB: _model
                                                              .friendsList
                                                              .elementAtOrNull(
                                                                  1),
                                                          lastMessage: '',
                                                          lastMessageTime:
                                                              getCurrentTimestamp,
                                                          lastMessageSentBy:
                                                              currentUserReference,
                                                          groupChatId:
                                                              random_data
                                                                  .randomInteger(
                                                                      1000000,
                                                                      9999999),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'users': _model
                                                                .friendsList,
                                                          },
                                                        ),
                                                      });
                                                      _model.newChatThread =
                                                          ChatsRecord
                                                              .getDocumentFromData({
                                                        ...createChatsRecordData(
                                                          userA:
                                                              profilePictureRowTblUsersRecord
                                                                  .reference,
                                                          userB: _model
                                                              .friendsList
                                                              .elementAtOrNull(
                                                                  1),
                                                          lastMessage: '',
                                                          lastMessageTime:
                                                              getCurrentTimestamp,
                                                          lastMessageSentBy:
                                                              currentUserReference,
                                                          groupChatId:
                                                              random_data
                                                                  .randomInteger(
                                                                      1000000,
                                                                      9999999),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'users': _model
                                                                .friendsList,
                                                          },
                                                        ),
                                                      }, chatsRecordReference);
                                                      logFirebaseEvent(
                                                          'MessageButton_navigate_to');

                                                      context.pushNamed(
                                                        'chat_2_Details',
                                                        queryParameters: {
                                                          'chatRef':
                                                              serializeParam(
                                                            _model
                                                                .newChatThread,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'chatRef': _model
                                                              .newChatThread,
                                                        },
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              if (widget.eventDetail
                                                      ?.eventOrganizerId !=
                                                  currentUserReference)
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0x43CDCED0),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    buttonSize: 50.0,
                                                    icon: Icon(
                                                      Icons.call,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'CallButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                            ].divide(const SizedBox(width: 9.0)),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '8y9ncbv1' /* Description */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: widget
                                                      .eventDetail!.description,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'aoxvr9ud' /*  Read More... */,
                                                  ),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                  ),
                                                  mouseCursor:
                                                      SystemMouseCursors.click,
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          logFirebaseEvent(
                                                              'EVENT_DETAILS_RichTextSpan_w2ddob6m_ON_T');
                                                          logFirebaseEvent(
                                                              'RichTextSpan_navigate_to');

                                                          context.pushNamed(
                                                              'AboutUs');
                                                        },
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            maxLines: 5,
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 15.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (widget
                                              .eventDetail?.eventOrganizerId !=
                                          currentUserReference)
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderRadius: 8.0,
                                          borderWidth: 2.0,
                                          buttonSize:
                                              MediaQuery.sizeOf(context).width *
                                                  0.17,
                                          fillColor: valueOrDefault<Color>(
                                            _model.isBookedMarked!
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          icon: Icon(
                                            Icons.bookmark_add_outlined,
                                            color: valueOrDefault<Color>(
                                              _model.isBookedMarked!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            size: 40.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'EVENT_DETAILS_PAGE_BookMarkButton_ON_TAP');
                                            logFirebaseEvent(
                                                'BookMarkButton_update_page_state');
                                            _model.isBookedMarked =
                                                !(_model.isBookedMarked ??
                                                    true);
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'BookMarkButton_backend_call');

                                            await widget.eventDetail!.reference
                                                .update(
                                                    createTblEventsRecordData(
                                              isBookedMarked:
                                                  _model.isBookedMarked,
                                            ));
                                          },
                                        ),
                                      if (widget
                                              .eventDetail?.eventOrganizerId !=
                                          currentUserReference)
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'EVENT_DETAILS_BuyTicketButton_ON_TAP');
                                            logFirebaseEvent(
                                                'BuyTicketButton_navigate_to');

                                            context.pushNamed(
                                              'Ticket',
                                              queryParameters: {
                                                'eventDetail': serializeParam(
                                                  widget.eventDetail,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'eventDetail':
                                                    widget.eventDetail,
                                              },
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'pmtvp0m6' /* BUY A TICKET */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.08,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .homePrimary1,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
