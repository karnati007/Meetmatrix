import '/flutter_flow/flutter_flow_util.dart';
import '/pages/events/components/category_list_component/category_list_component_widget.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchBarTextField widget.
  FocusNode? searchBarTextFieldFocusNode;
  TextEditingController? searchBarTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchBarTextFieldTextControllerValidator;
  // Model for CategoryListComponent component.
  late CategoryListComponentModel categoryListComponentModel;

  @override
  void initState(BuildContext context) {
    categoryListComponentModel =
        createModel(context, () => CategoryListComponentModel());
  }

  @override
  void dispose() {
    searchBarTextFieldFocusNode?.dispose();
    searchBarTextFieldTextController?.dispose();

    categoryListComponentModel.dispose();
  }
}
