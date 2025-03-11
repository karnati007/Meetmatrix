import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ads_mob_model.dart';
export 'ads_mob_model.dart';

class AdsMobWidget extends StatefulWidget {
  const AdsMobWidget({super.key});

  @override
  State<AdsMobWidget> createState() => _AdsMobWidgetState();
}

class _AdsMobWidgetState extends State<AdsMobWidget> {
  late AdsMobModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdsMobModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'adsMob'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: const SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowAdBanner(
                height: 100.0,
                showsTestAd: true,
                androidAdUnitID: 'ca-app-pub-6583512306032578/4749829063',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
