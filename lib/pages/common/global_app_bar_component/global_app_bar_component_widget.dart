import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'global_app_bar_component_model.dart';
export 'global_app_bar_component_model.dart';

class GlobalAppBarComponentWidget extends StatefulWidget {
  const GlobalAppBarComponentWidget({super.key});

  @override
  State<GlobalAppBarComponentWidget> createState() =>
      _GlobalAppBarComponentWidgetState();
}

class _GlobalAppBarComponentWidgetState
    extends State<GlobalAppBarComponentWidget> {
  late GlobalAppBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlobalAppBarComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0x43CDCED0),
                    shape: BoxShape.circle,
                  ),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'GLOBAL_APP_BAR_COMPONENT_BackButton_ON_T');
                      logFirebaseEvent('BackButton_navigate_back');
                      context.pop();
                    },
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0x30CDCED0),
                    shape: BoxShape.circle,
                  ),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.favorite,
                      color: FlutterFlowTheme.of(context).error,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('FavoriteButton pressed ...');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
