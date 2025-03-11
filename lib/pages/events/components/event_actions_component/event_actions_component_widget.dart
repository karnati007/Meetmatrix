import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'event_actions_component_model.dart';
export 'event_actions_component_model.dart';

class EventActionsComponentWidget extends StatefulWidget {
  const EventActionsComponentWidget({
    super.key,
    required this.eventDetail,
    required this.eventTicket,
  });

  final TblEventsRecord? eventDetail;
  final TblTicketsRecord? eventTicket;

  @override
  State<EventActionsComponentWidget> createState() =>
      _EventActionsComponentWidgetState();
}

class _EventActionsComponentWidgetState
    extends State<EventActionsComponentWidget> {
  late EventActionsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventActionsComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 320.0, 20.0, 450.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: const Color(0xFFFBFAFA),
            borderRadius: BorderRadius.circular(20.0),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    height: MediaQuery.sizeOf(context).width * 0.1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                      shape: BoxShape.circle,
                    ),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.call,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 20.0,
                      ),
                      onPressed: () {
                        print('MessageButton pressed ...');
                      },
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'm0g5y8oi' /* Call */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    height: MediaQuery.sizeOf(context).width * 0.1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.directions_sharp,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'EVENT_ACTIONS_COMPONENT_DirectionButton_');
                        logFirebaseEvent('DirectionButton_navigate_to');

                        context.pushNamed('LocationView');
                      },
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '8ql55g8e' /* Directions */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    height: MediaQuery.sizeOf(context).width * 0.1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).yellow,
                      shape: BoxShape.circle,
                    ),
                    child: Transform.rotate(
                      angle: 125.0 * (math.pi / 180),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        buttonSize: 50.0,
                        icon: FaIcon(
                          FontAwesomeIcons.ticketAlt,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'EVENT_ACTIONS_COMPONENT_TicketButton_ON_');
                          logFirebaseEvent('TicketButton_update_app_state');
                          FFAppState().updateEventStateStruct(
                            (e) => e
                              ..quantity = widget.eventTicket?.quantity
                              ..ticketTotalPrice =
                                  widget.eventTicket?.pricePaid
                              ..paymentType = widget.eventTicket?.paymentType
                              ..ticketReference = widget.eventTicket?.reference
                              ..ticketType =
                                  widget.eventTicket?.ticketType?.name,
                          );
                          safeSetState(() {});
                          logFirebaseEvent('TicketButton_navigate_to');

                          context.pushNamed(
                            'EventTicket',
                            queryParameters: {
                              'eventDetail': serializeParam(
                                widget.eventDetail,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'eventDetail': widget.eventDetail,
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'oxa7au9p' /* My Ticket */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
