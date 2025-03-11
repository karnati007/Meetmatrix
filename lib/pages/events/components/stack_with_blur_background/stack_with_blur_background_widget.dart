import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'stack_with_blur_background_model.dart';
export 'stack_with_blur_background_model.dart';

class StackWithBlurBackgroundWidget extends StatefulWidget {
  const StackWithBlurBackgroundWidget({super.key});

  @override
  State<StackWithBlurBackgroundWidget> createState() =>
      _StackWithBlurBackgroundWidgetState();
}

class _StackWithBlurBackgroundWidgetState
    extends State<StackWithBlurBackgroundWidget> {
  late StackWithBlurBackgroundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StackWithBlurBackgroundModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 1.0,
              sigmaY: 0.0,
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/circus_maximus_tour.jpeg',
                  ).image,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: const BoxDecoration(),
        ),
      ],
    );
  }
}
