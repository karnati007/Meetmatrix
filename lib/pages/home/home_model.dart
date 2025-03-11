import '/flutter_flow/flutter_flow_util.dart';
import '/pages/events/components/category_list_component/category_list_component_widget.dart';
import '/pages/events/components/events_list_component/events_list_component_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homeWalthrough1Controller;
  final shortcutsFocusNode = FocusNode();
  // State field(s) for SearchBarTextField widget.
  FocusNode? searchBarTextFieldFocusNode;
  TextEditingController? searchBarTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchBarTextFieldTextControllerValidator;
  // Model for CategoryListComponent component.
  late CategoryListComponentModel categoryListComponentModel;
  // Model for EventsListComponent component.
  late EventsListComponentModel eventsListComponentModel;

  @override
  void initState(BuildContext context) {
    shortcutsFocusNode.requestFocus();
    categoryListComponentModel =
        createModel(context, () => CategoryListComponentModel());
    eventsListComponentModel =
        createModel(context, () => EventsListComponentModel());
  }

  @override
  void dispose() {
    homeWalthrough1Controller?.finish();
    searchBarTextFieldFocusNode?.dispose();
    searchBarTextFieldTextController?.dispose();

    categoryListComponentModel.dispose();
    eventsListComponentModel.dispose();
  }
}
