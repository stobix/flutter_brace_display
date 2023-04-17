import 'dart:math';

import 'package:equatable/equatable.dart';
import '../tools/size_wrapper.dart';
import 'package:flutter/material.dart';

part 'components/brace.dart';
part 'components/bracket.dart';

class BraceDisplay extends StatefulWidget {
  /// The widget put to the left of the brace
  final Widget? head;

  /// The widget put to the right of the brace
  final Widget child;

  /// Thickness of the brace
  final double braceThickness;

  /// Relative y-position of the head, from 0.0 (topmost) to 1.0 (bottommost)
  final double? headPos;

  /// Experimental feature
  final List<BracketMeta>? brackets;

  /// Color of the brace
  final Color braceColor;

  /// Whether to show the brace.
  final bool showBrace;

  const BraceDisplay({
    this.head,
    required this.child,
    this.headPos,
    this.braceThickness = 0.3,
    this.braceColor = Colors.black,
    this.brackets,
    this.showBrace = true,
    super.key,
  });

  @override
  State<BraceDisplay> createState() => _BraceDisplayState();
}

class _BraceDisplayState extends State<BraceDisplay> {
  double braceWidth = 50;
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 3,
            child: widget.headPos != null
                ? Container(
                    alignment: FractionalOffset(1, widget.headPos!),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [widget.head ?? Container()]))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [if (widget.head != null) widget.head!],
                  ),
          ),
          Flexible(
            child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                      SizeWrapper(
                        onSizeChange: (Size size) {
                          setState(() {
                            braceWidth = size.width;
                          });
                        },
                        child: widget.showBrace
                            ? Brace(
                                thickness: widget.braceThickness,
                                headPos: widget.headPos ?? .5,
                                color: widget.braceColor,
                              )
                            : Container(),
                      )
                    ] +
                    (widget.brackets?.map((meta) {
                          switch (meta.runtimeType) {
                            case BracketStartMeta:
                              return Positioned(
                                  right: 0,
                                  top: 0,
                                  height: meta.pos,
                                  width: braceWidth / 4,
                                  child: const BracketStart());
                            case BracketEndMeta:
                              return Positioned(
                                  right: 0,
                                  top: meta.pos,
                                  height: query.size.height - meta.pos,
                                  width: braceWidth / 4,
                                  child: const BracketEnd());
                            case BracketFullMeta:
                              return Positioned(
                                  right: 0,
                                  top: (meta as BracketFullMeta).endPos,
                                  height: meta.pos - meta.endPos,
                                  width: braceWidth / 4,
                                  child: const Bracket());
                            default:
                              return Container();
                          }
                        }).toList() ??
                        [])),
          ),
          Flexible(flex: 10, child: widget.child),
        ],
      ),
    );
  }
}

abstract class BracketMeta with EquatableMixin {
  double pos;
  String key;
  BracketMeta({required this.pos, required this.key});
  @override
  List<Object?> get props => [pos];
}

class BracketStartMeta extends BracketMeta {
  BracketStartMeta({required super.pos, required super.key});
  BracketFullMeta combine(BracketEndMeta end) =>
      BracketFullMeta(pos: pos, endPos: end.pos, key: key);
}

class BracketEndMeta extends BracketMeta {
  BracketEndMeta({required super.pos, required super.key});
  BracketFullMeta combine(BracketStartMeta start) =>
      BracketFullMeta(pos: start.pos, endPos: pos, key: key);
}

class BracketFullMeta extends BracketMeta {
  double endPos;
  @override
  List<Object?> get props => [pos, endPos];
  BracketFullMeta(
      {required super.pos, required this.endPos, required super.key});
}
