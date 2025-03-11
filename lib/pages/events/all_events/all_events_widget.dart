import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/events/components/booked_marked_events_component/booked_marked_events_component_widget.dart';
import '/pages/events/components/events_list_component/events_list_component_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'all_events_model.dart';
export 'all_events_model.dart';

class AllEventsWidget extends StatefulWidget {
  /// This shows a list of all events a user can see
  const AllEventsWidget({
    super.key,
    required this.filterType,
    required this.title,
  });

  final EventFilterType? filterType;
  final String? title;

  @override
  State<AllEventsWidget> createState() => _AllEventsWidgetState();
}

class _AllEventsWidgetState extends State<AllEventsWidget> {
  late AllEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllEventsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AllEvents'});
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
                                      'ALL_EVENTS_PAGE_Icon_kidwcpi3_ON_TAP');
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
                                    'ALL_EVENTS_PAGE_Row_4iq3hinr_ON_TAP');
                                logFirebaseEvent('Row_navigate_to');

                                context.pushNamed('AddEvent');
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
                                      'zvb85riv' /* Add Event */,
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
                  sigmaX: 0.0,
                  sigmaY: 0.0,
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: const BoxDecoration(),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            FFAppConstants.sidePadding.toDouble(),
                            0.0,
                          ),
                          valueOrDefault<double>(
                            FFAppConstants.safeArea.toDouble(),
                            0.0,
                          ),
                          valueOrDefault<double>(
                            FFAppConstants.sidePadding.toDouble(),
                            0.0,
                          ),
                          0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ALL_EVENTS_PAGE_BackButton_ON_TAP');
                                    logFirebaseEvent(
                                        'BackButton_navigate_back');
                                    context.pop();
                                  },
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.title,
                                    'Events',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.search_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ALL_EVENTS_PAGE_SearchButton_ON_TAP');
                                        logFirebaseEvent(
                                            'SearchButton_navigate_to');

                                        context.pushNamed('Search');
                                      },
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
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
                                        onPressed: (UserTypes.Organizer !=
                                                currentUserDocument?.userType)
                                            ? null
                                            : () async {
                                                logFirebaseEvent(
                                                    'ALL_EVENTS_PAGE_KebabButton_ON_TAP');
                                                logFirebaseEvent(
                                                    'KebabButton_drawer');
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                              },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            FFAppConstants.sidePadding.toDouble(),
                            0.0,
                          ),
                          valueOrDefault<double>(
                            FFAppConstants.topPadding.toDouble(),
                            0.0,
                          ),
                          valueOrDefault<double>(
                            FFAppConstants.sidePadding.toDouble(),
                            0.0,
                          ),
                          0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            if (widget.filterType == EventFilterType.All) {
                              return wrapWithModel(
                                model: _model.eventsListComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const EventsListComponentWidget(
                                  categoryFilter: EventCategory.values,
                                ),
                              );
                            } else {
                              return wrapWithModel(
                                model: _model.bookedMarkedEventsComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const BookedMarkedEventsComponentWidget(
                                  categoryFilter: EventCategory.values,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
