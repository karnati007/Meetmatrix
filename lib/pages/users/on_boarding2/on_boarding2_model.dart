import '/flutter_flow/flutter_flow_util.dart';
import 'on_boarding2_widget.dart' show OnBoarding2Widget;
import 'package:flutter/material.dart';

class OnBoarding2Model extends FlutterFlowModel<OnBoarding2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
