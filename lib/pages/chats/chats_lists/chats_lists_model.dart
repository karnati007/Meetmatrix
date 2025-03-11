import '/flutter_flow/flutter_flow_util.dart';
import 'chats_lists_widget.dart' show ChatsListsWidget;
import 'package:flutter/material.dart';

class ChatsListsModel extends FlutterFlowModel<ChatsListsWidget> {
  ///  State fields for stateful widgets in this page.

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
