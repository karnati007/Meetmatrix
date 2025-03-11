import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'profile_redirect_page_model.dart';
export 'profile_redirect_page_model.dart';

class ProfileRedirectPageWidget extends StatefulWidget {
  /// Users Profile settings
  const ProfileRedirectPageWidget({super.key});

  @override
  State<ProfileRedirectPageWidget> createState() =>
      _ProfileRedirectPageWidgetState();
}

class _ProfileRedirectPageWidgetState extends State<ProfileRedirectPageWidget> {
  late ProfileRedirectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileRedirectPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileRedirectPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_REDIRECT_ProfileRedirectPage_ON_');
      if (UserTypes.Organizer == currentUserDocument?.userType) {
        logFirebaseEvent('ProfileRedirectPage_navigate_to');

        context.pushNamed('Organiser_Profile');

        return;
      } else {
        logFirebaseEvent('ProfileRedirectPage_navigate_to');

        context.pushNamed('Profile');

        return;
      }
    });

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
      ),
    );
  }
}
