import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'category_list_component_widget.dart' show CategoryListComponentWidget;
import 'package:flutter/material.dart';

class CategoryListComponentModel
    extends FlutterFlowModel<CategoryListComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CategoryChoiceChips widget.
  FormFieldController<List<String>>? categoryChoiceChipsValueController;
  String? get categoryChoiceChipsValue =>
      categoryChoiceChipsValueController?.value?.firstOrNull;
  set categoryChoiceChipsValue(String? val) =>
      categoryChoiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
