import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/pages/common/walthrough_tip/walthrough_tip_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final rowE5x26suz = GlobalKey();

/// signup
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: rowE5x26suz,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).accent1,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalthroughTipWidget(
              explanation: 'Feel free to use different signup ways',
            ),
          ),
        ],
      ),
    ];
