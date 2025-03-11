import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/pages/common/walthrough_tip/walthrough_tip_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final circleImageEt8eup6r = GlobalKey();
final columnL4130ee9 = GlobalKey();
final textQlz8xavj = GlobalKey();
final containerZ86lqoj8 = GlobalKey();

/// HomeWalthrough1
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: circleImageEt8eup6r,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).accent1,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalthroughTipWidget(
              explanation: FFLocalizations.of(context).getText(
                'iagy6vjg' /* Welcome to your Profile! Here,... */,
              ),
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: columnL4130ee9,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).accent1,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalthroughTipWidget(
              explanation: FFLocalizations.of(context).getText(
                '8m65owh8' /* Set your location to personali... */,
              ),
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: textQlz8xavj,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: FlutterFlowTheme.of(context).accent1,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalthroughTipWidget(
              explanation: FFLocalizations.of(context).getText(
                'ncvexmpq' /* Discover and join trending eve... */,
              ),
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: containerZ86lqoj8,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).accent1,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalthroughTipWidget(
              explanation: FFLocalizations.of(context).getText(
                '42l9mcuk' /* "Choose your favorite categori... */,
              ),
            ),
          ),
        ],
      ),
    ];
