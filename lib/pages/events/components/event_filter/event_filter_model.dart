import '/flutter_flow/flutter_flow_util.dart';
import '/pages/events/components/category_list_component/category_list_component_widget.dart';
import 'event_filter_widget.dart' show EventFilterWidget;
import 'package:flutter/material.dart';

class EventFilterModel extends FlutterFlowModel<EventFilterWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CategoryListComponent component.
  late CategoryListComponentModel categoryListComponentModel;
  DateTime? datePicked;
  // State field(s) for CalenderEventTextField widget.
  FocusNode? calenderEventTextFieldFocusNode;
  TextEditingController? calenderEventTextFieldTextController;
  String? Function(BuildContext, String?)?
      calenderEventTextFieldTextControllerValidator;
  // State field(s) for LocationEventTextField widget.
  FocusNode? locationEventTextFieldFocusNode;
  TextEditingController? locationEventTextFieldTextController;
  String? Function(BuildContext, String?)?
      locationEventTextFieldTextControllerValidator;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {
    categoryListComponentModel =
        createModel(context, () => CategoryListComponentModel());
  }

  @override
  void dispose() {
    categoryListComponentModel.dispose();
    calenderEventTextFieldFocusNode?.dispose();
    calenderEventTextFieldTextController?.dispose();

    locationEventTextFieldFocusNode?.dispose();
    locationEventTextFieldTextController?.dispose();
  }
}
