import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'covid19_declaration_model.dart';
export 'covid19_declaration_model.dart';

class Covid19DeclarationWidget extends StatefulWidget {
  const Covid19DeclarationWidget({
    super.key,
    required this.eventDetail,
    this.quantity,
  });

  final TblEventsRecord? eventDetail;
  final int? quantity;

  @override
  State<Covid19DeclarationWidget> createState() =>
      _Covid19DeclarationWidgetState();
}

class _Covid19DeclarationWidgetState extends State<Covid19DeclarationWidget> {
  late Covid19DeclarationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Covid19DeclarationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'covid19_declaration'});
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 1.0,
                    sigmaY: 0.0,
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/images.jpg',
                        ).image,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 2.06),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    width: 398.0,
                    height: 792.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 40.0,
                            child: Divider(
                              thickness: 4.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'rqgqa7f1' /* Stay safe, be safe */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: 352.0,
                              height: 165.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/istockphoto-1205785237-612x612.jpg',
                                  ).image,
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'tsv7bpf4' /* Covid- 19 Self Health Declarat... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 15.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'kgs2f90h' /* Enjoy your favorite dish and a... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 25.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'hh4si3ee' /* • Enjoy your favorite dish and... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'hvzkkot7' /* • I have not travelled interna... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 25.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'iiyzq2te' /* I confirm that I am healthy */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 180.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'COVID19_DECLARATION_CHECKOUT_BTN_ON_TAP');
                                logFirebaseEvent('Button_stripe_payment');
                                final paymentResponse =
                                    await processStripePayment(
                                  context,
                                  amount: functions
                                      .calculateTicketTotalPriceForStripe(
                                          widget.eventDetail!.price,
                                          widget.quantity!),
                                  currency: 'USD',
                                  customerEmail: currentUserEmail,
                                  customerName: currentUserDisplayName,
                                  description: 'Test Transaction',
                                  allowGooglePay: true,
                                  allowApplePay: false,
                                  themeStyle: ThemeMode.system,
                                  buttonColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  buttonTextColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                );
                                if (paymentResponse.paymentId == null &&
                                    paymentResponse.errorMessage != null) {
                                  showSnackbar(
                                    context,
                                    'Error: ${paymentResponse.errorMessage}',
                                  );
                                }
                                _model.paymentId =
                                    paymentResponse.paymentId ?? '';

                                logFirebaseEvent('Button_backend_call');

                                var tblTicketsRecordReference =
                                    TblTicketsRecord.collection.doc();
                                await tblTicketsRecordReference.set({
                                  ...createTblTicketsRecordData(
                                    eventId:
                                        FFAppState().eventState.eventReference,
                                    pricePaid: functions.convertStringToDouble(
                                        functions
                                            .convertStringToDouble(FFAppState()
                                                .eventState
                                                .ticketTotalPrice
                                                .toString())
                                            .toString()),
                                    paymentType: PaymentType.ApplePay,
                                    quantity: FFAppState().eventState.quantity,
                                    currency: FFAppState().eventState.currency,
                                    userId: currentUserReference,
                                    ticketType: functions.convertToTicketType(
                                        FFAppState().eventState.ticketType),
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creation_time':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                _model.newTicktet =
                                    TblTicketsRecord.getDocumentFromData({
                                  ...createTblTicketsRecordData(
                                    eventId:
                                        FFAppState().eventState.eventReference,
                                    pricePaid: functions.convertStringToDouble(
                                        functions
                                            .convertStringToDouble(FFAppState()
                                                .eventState
                                                .ticketTotalPrice
                                                .toString())
                                            .toString()),
                                    paymentType: PaymentType.ApplePay,
                                    quantity: FFAppState().eventState.quantity,
                                    currency: FFAppState().eventState.currency,
                                    userId: currentUserReference,
                                    ticketType: functions.convertToTicketType(
                                        FFAppState().eventState.ticketType),
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creation_time': DateTime.now(),
                                    },
                                  ),
                                }, tblTicketsRecordReference);
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().updateEventStateStruct(
                                  (e) => e
                                    ..paymentType = PaymentType.GooglePay
                                    ..ticketReference =
                                        _model.newTicktet?.reference,
                                );
                                safeSetState(() {});
                                logFirebaseEvent(
                                    'Button_trigger_push_notification');
                                triggerPushNotification(
                                  notificationTitle:
                                      'Successfully Joined Event : ${widget.eventDetail?.name}',
                                  notificationText:
                                      'You have successfully joined this event',
                                  notificationSound: 'default',
                                  userRefs: [currentUserReference!],
                                  initialPageName: 'EventBooked',
                                  parameterData: {
                                    'eventDetail': widget.eventDetail,
                                  },
                                );
                                logFirebaseEvent('Button_backend_call');
                                await SendEmailCall.call(
                                  to: currentUserEmail,
                                  subject:
                                      'Successfully Joined Event : ${widget.eventDetail?.name}',
                                  text:
                                      'You have successfully joined this event which is on the  ${dateTimeFormat(
                                    "d",
                                    widget.eventDetail?.startTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )} - ${dateTimeFormat(
                                    "d MMMM y",
                                    widget.eventDetail?.endTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )} and the location is ${widget.eventDetail?.locationName}',
                                );

                                logFirebaseEvent('Button_navigate_to');

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

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'z9prbx52' /* Checkout */,
                              ),
                              options: FFButtonOptions(
                                width: 300.0,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconAlignment: IconAlignment.start,
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(14.0),
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
    );
  }
}
