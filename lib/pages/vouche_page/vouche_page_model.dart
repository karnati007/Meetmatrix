import '/flutter_flow/flutter_flow_util.dart';
import '/pages/ticket_payment/credit_card/credit_card_widget.dart';
import 'vouche_page_widget.dart' show VouchePageWidget;
import 'package:flutter/material.dart';

class VouchePageModel extends FlutterFlowModel<VouchePageWidget> {
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
