import '/components/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'terms_widget.dart' show TermsWidget;
import 'package:flutter/material.dart';

class TermsModel extends FlutterFlowModel<TermsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
  }
}
