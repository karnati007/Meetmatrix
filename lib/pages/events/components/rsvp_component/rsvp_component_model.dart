import '/flutter_flow/flutter_flow_util.dart';
import 'rsvp_component_widget.dart' show RsvpComponentWidget;
import 'package:flutter/material.dart';

class RsvpComponentModel extends FlutterFlowModel<RsvpComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();
  }
}
