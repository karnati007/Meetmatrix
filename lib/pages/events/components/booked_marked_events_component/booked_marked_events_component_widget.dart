import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'booked_marked_events_component_model.dart';
export 'booked_marked_events_component_model.dart';

class BookedMarkedEventsComponentWidget extends StatefulWidget {
  const BookedMarkedEventsComponentWidget({
    super.key,
    required this.categoryFilter,
  });

  final List<EventCategory>? categoryFilter;

  @override
  State<BookedMarkedEventsComponentWidget> createState() =>
      _BookedMarkedEventsComponentWidgetState();
}

class _BookedMarkedEventsComponentWidgetState
    extends State<BookedMarkedEventsComponentWidget>
    with TickerProviderStateMixin {
  late BookedMarkedEventsComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookedMarkedEventsComponentModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 120.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: StreamBuilder<List<TblEventsRecord>>(
        stream: queryTblEventsRecord(
          queryBuilder: (tblEventsRecord) => tblEventsRecord
              .whereIn('category',
                  widget.categoryFilter?.map((e) => e.serialize()).toList())
              .where(
                'event_organizer_id',
                isNotEqualTo: currentUserReference,
              )
              .where(
                'is_booked_marked',
                isEqualTo: true,
              ),
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
          List<TblEventsRecord> eventsListViewTblEventsRecordList =
              snapshot.data!;

          return ListView.separated(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: eventsListViewTblEventsRecordList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 20.0),
            itemBuilder: (context, eventsListViewIndex) {
              final eventsListViewTblEventsRecord =
                  eventsListViewTblEventsRecordList[eventsListViewIndex];
              return FutureBuilder<int>(
                future: queryTblTicketsRecordCount(
                  queryBuilder: (tblTicketsRecord) => tblTicketsRecord.where(
                    'event_id',
                    isEqualTo: eventsListViewTblEventsRecord.reference,
                  ),
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
                  int bottomContainerCount = snapshot.data!;

                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'BOOKED_MARKED_EVENTS_COMPONENT_BottomCon');
                      if (bottomContainerCount > 0) {
                        logFirebaseEvent('BottomContainer_navigate_to');

                        context.pushNamed(
                          'EventBooked',
                          queryParameters: {
                            'eventDetail': serializeParam(
                              eventsListViewTblEventsRecord,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'eventDetail': eventsListViewTblEventsRecord,
                          },
                        );

                        return;
                      } else {
                        logFirebaseEvent('BottomContainer_navigate_to');

                        context.pushNamed(
                          'EventPreview',
                          queryParameters: {
                            'eventDetail': serializeParam(
                              eventsListViewTblEventsRecord,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'eventDetail': eventsListViewTblEventsRecord,
                          },
                        );

                        return;
                      }
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: StreamBuilder<List<TblEventImagesRecord>>(
                                stream: queryTblEventImagesRecord(
                                  queryBuilder: (tblEventImagesRecord) =>
                                      tblEventImagesRecord.where(
                                    'event_id',
                                    isEqualTo:
                                        eventsListViewTblEventsRecord.reference,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<TblEventImagesRecord>
                                      meetupImageTblEventImagesRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final meetupImageTblEventImagesRecord =
                                      meetupImageTblEventImagesRecordList
                                              .isNotEmpty
                                          ? meetupImageTblEventImagesRecordList
                                              .first
                                          : null;

                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          meetupImageTblEventImagesRecord!
                                              .imagePath,
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.borderRadiusSmall
                                            .toDouble(),
                                        0.0,
                                      )),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  eventsListViewTblEventsRecord.name
                                      .maybeHandleOverflow(
                                    maxChars: 15,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${dateTimeFormat(
                                          "d",
                                          eventsListViewTblEventsRecord
                                              .startTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )} - ${dateTimeFormat(
                                          "d MMMM y",
                                          eventsListViewTblEventsRecord.endTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                        height:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Text(
                                        eventsListViewTblEventsRecord
                                            .locationName
                                            .maybeHandleOverflow(
                                          maxChars: 10,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                          SizedBox(
                            height: 50.0,
                            child: VerticalDivider(
                              thickness: 2.0,
                              indent: 9.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${eventsListViewTblEventsRecord.currencySymbol}${formatNumber(
                                  eventsListViewTblEventsRecord.price,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                )}. ${eventsListViewTblEventsRecord.currency?.name}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (bottomContainerCount > 0) {
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.25,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius: BorderRadius.circular(
                                            valueOrDefault<double>(
                                          FFAppConstants.borderRadiusSmall
                                              .toDouble(),
                                          0.0,
                                        )),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'htfngc53' /* Joined */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    );
                                  } else {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'BOOKED_MARKED_EVENTS_COMPONENT_Container');
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                          'EventDetails',
                                          queryParameters: {
                                            'eventDetail': serializeParam(
                                              eventsListViewTblEventsRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'eventDetail':
                                                eventsListViewTblEventsRecord,
                                          },
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.25,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              valueOrDefault<double>(
                                            FFAppConstants.borderRadiusSmall
                                                .toDouble(),
                                            0.0,
                                          )),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'u6j7271s' /* Join Now */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ]
                                .divide(const SizedBox(height: 8.0))
                                .addToStart(const SizedBox(height: 10.0)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ).animateOnPageLoad(animationsMap['listViewOnPageLoadAnimation']!);
        },
      ),
    );
  }
}
