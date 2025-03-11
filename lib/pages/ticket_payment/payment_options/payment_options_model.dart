import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_options_widget.dart' show PaymentOptionsWidget;
import 'package:flutter/material.dart';

class PaymentOptionsModel extends FlutterFlowModel<PaymentOptionsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ApplePayCheckbox widget.
  bool? applePayCheckboxValue;
  // State field(s) for PayPalCheckbox widget.
  bool? payPalCheckboxValue;
  // State field(s) for GooglePayCheckbox widget.
  bool? googlePayCheckboxValue;
  // State field(s) for DebitCardCheckbox widget.
  bool? debitCardCheckboxValue;
  // State field(s) for CreditCardForm widget.
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
