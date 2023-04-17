import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'size_render_object.dart';


class SizeWrapper extends SingleChildRenderObjectWidget {

  final OnWidgetSizeChange onSizeChange;

  const SizeWrapper({
    super.key,
    required this.onSizeChange,
    required Widget super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return SizeRenderObject(onSizeChange);
  }
}

class DirectionSizeWrapper extends SingleChildRenderObjectWidget {

  final OnWidgetSizeChange onSizeChange;

  final OneDimRenderDirection direction;

  const DirectionSizeWrapper({
    super.key,
    this.direction = OneDimRenderDirection.vertical,
    required this.onSizeChange,
    required Widget super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return OneDimRenderObject(onSizeChange, direction);
  }
}
