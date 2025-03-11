import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'ticket_widget.dart' show TicketWidget;
import 'package:flutter/material.dart';

class TicketModel extends FlutterFlowModel<TicketWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for TotalPriceText widget.
  FocusNode? totalPriceTextFocusNode;
  TextEditingController? totalPriceTextTextController;
  String? Function(BuildContext, String?)?
      totalPriceTextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    totalPriceTextFocusNode?.dispose();
    totalPriceTextTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
