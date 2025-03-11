import '/components/users_profile_badge_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UsersProfileBadge component.
  late UsersProfileBadgeModel usersProfileBadgeModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    usersProfileBadgeModel =
        createModel(context, () => UsersProfileBadgeModel());
  }

  @override
  void dispose() {
    usersProfileBadgeModel.dispose();
    tabBarController?.dispose();
  }
}
