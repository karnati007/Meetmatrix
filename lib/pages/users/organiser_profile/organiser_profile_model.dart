import '/components/users_profile_badge_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/events/components/users_events_list_component/users_events_list_component_widget.dart';
import 'organiser_profile_widget.dart' show OrganiserProfileWidget;
import 'package:flutter/material.dart';

class OrganiserProfileModel extends FlutterFlowModel<OrganiserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UsersProfileBadge component.
  late UsersProfileBadgeModel usersProfileBadgeModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for UsersEventsListComponent component.
  late UsersEventsListComponentModel usersEventsListComponentModel;

  @override
  void initState(BuildContext context) {
    usersProfileBadgeModel =
        createModel(context, () => UsersProfileBadgeModel());
    usersEventsListComponentModel =
        createModel(context, () => UsersEventsListComponentModel());
  }

  @override
  void dispose() {
    usersProfileBadgeModel.dispose();
    tabBarController?.dispose();
    usersEventsListComponentModel.dispose();
  }
}
