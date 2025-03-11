import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'users_profile_badge_model.dart';
export 'users_profile_badge_model.dart';

class UsersProfileBadgeWidget extends StatefulWidget {
  const UsersProfileBadgeWidget({super.key});

  @override
  State<UsersProfileBadgeWidget> createState() =>
      _UsersProfileBadgeWidgetState();
}

class _UsersProfileBadgeWidgetState extends State<UsersProfileBadgeWidget> {
  late UsersProfileBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersProfileBadgeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AuthUserStreamWidget(
                builder: (context) => FutureBuilder<int>(
                  future: queryTblFollowersRecordCount(
                    parent: currentUserReference,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    int followersTextCount = snapshot.data!;

                    return Text(
                      valueOrDefault(currentUserDocument?.noOfFollowers, 0)
                          .toString(),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                    );
                  },
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '7mm67j4k' /* Followers */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
            child: VerticalDivider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'qnrdlbhb' /* 0 */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'vkb76h9e' /* Following */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
            child: VerticalDivider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<int>(
                future: queryTblEventsRecordCount(
                  queryBuilder: (tblEventsRecord) => tblEventsRecord.where(
                    'event_organizer_id',
                    isEqualTo: currentUserReference,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  int eventsTextCount = snapshot.data!;

                  return Text(
                    valueOrDefault<String>(
                      eventsTextCount.toString(),
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  );
                },
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'klhbypmd' /* Events */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
