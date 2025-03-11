import '/components/dark_light_switch_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DarkLightSwitch component.
  late DarkLightSwitchModel darkLightSwitchModel;

  @override
  void initState(BuildContext context) {
    darkLightSwitchModel = createModel(context, () => DarkLightSwitchModel());
  }

  @override
  void dispose() {
    darkLightSwitchModel.dispose();
  }
}
