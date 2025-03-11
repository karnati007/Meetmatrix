import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'payment_details_popup_model.dart';
export 'payment_details_popup_model.dart';

class PaymentDetailsPopupWidget extends StatefulWidget {
  const PaymentDetailsPopupWidget({
    super.key,
    required this.eventDetail,
  });

  final TblEventsRecord? eventDetail;

  @override
  State<PaymentDetailsPopupWidget> createState() =>
      _PaymentDetailsPopupWidgetState();
}

class _PaymentDetailsPopupWidgetState extends State<PaymentDetailsPopupWidget> {
  late PaymentDetailsPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentDetailsPopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 313.0,
      height: 304.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tertiary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).tertiary,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 45.0,
            child: Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Container(
              decoration: const BoxDecoration(),
              child: FlutterFlowCreditCardForm(
                formKey: _model.creditCardFormKey,
                creditCardModel: _model.creditCardInfo,
                obscureNumber: true,
                obscureCvv: false,
                spacing: 12.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                inputDecoration: InputDecoration(
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).alternate,
                    ),
                    child: Checkbox(
                      value: _model.checkboxValue ??= false,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue = newValue!);
                        if (newValue!) {
                          logFirebaseEvent(
                              'PAYMENT_DETAILS_POPUP_Checkbox_txree6p3_');
                          logFirebaseEvent('Checkbox_update_app_state');
                          FFAppState().isprimarycard = true;
                          safeSetState(() {});
                        }
                      },
                      side: BorderSide(
                        width: 2,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      activeColor: FlutterFlowTheme.of(context).primaryText,
                      checkColor: FlutterFlowTheme.of(context).tertiary,
                    ),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'aqale01o' /* Save as a primary card */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PAYMENT_DETAILS_POPUP_CONTINUE_BTN_ON_TA');
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed(
                  'payment_options',
                  queryParameters: {
                    'eventDetail': serializeParam(
                      widget.eventDetail,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'eventDetail': widget.eventDetail,
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.topToBottom,
                    ),
                  },
                );
              },
              text: FFLocalizations.of(context).getText(
                'w8zrtoyf' /* Continue */,
              ),
              options: FFButtonOptions(
                width: 246.0,
                height: 50.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconAlignment: IconAlignment.start,
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
