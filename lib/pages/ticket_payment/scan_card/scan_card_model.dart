import '/flutter_flow/flutter_flow_util.dart';
import '/pages/ticket_payment/credit_card/credit_card_widget.dart';
import 'scan_card_widget.dart' show ScanCardWidget;
import 'package:flutter/material.dart';

class ScanCardModel extends FlutterFlowModel<ScanCardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CreditCard component.
  late CreditCardWidgetModel creditCardModel;

  @override
  void initState(BuildContext context) {
    creditCardModel = createModel(context, () => CreditCardWidgetModel());
  }

  @override
  void dispose() {
    creditCardModel.dispose();
  }
}
