import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/pages/common/material_dialog1/material_dialog1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final richText6wl9z1ii = GlobalKey();

/// Resend Code
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: richText6wl9z1ii,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).accent1,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const MaterialDialog1Widget(),
          ),
        ],
      ),
    ];
