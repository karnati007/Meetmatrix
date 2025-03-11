import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_sheet_widget.dart' show BottomSheetWidget;
import 'package:flutter/material.dart';

class BottomSheetModel extends FlutterFlowModel<BottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for streamname widget.
  FocusNode? streamnameFocusNode;
  TextEditingController? streamnameTextController;
  String? Function(BuildContext, String?)? streamnameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    streamnameFocusNode?.dispose();
    streamnameTextController?.dispose();
  }
}
