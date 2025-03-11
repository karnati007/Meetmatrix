import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'covid19_declaration_widget.dart' show Covid19DeclarationWidget;
import 'package:flutter/material.dart';

class Covid19DeclarationModel
    extends FlutterFlowModel<Covid19DeclarationWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TblTicketsRecord? newTicktet;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
