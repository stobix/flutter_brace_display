part of '../brace_display.dart';

class BracketStart extends StatelessWidget{
  final double thickness;

  const BracketStart({this.thickness=1, super.key});

  @override
  Widget build(BuildContext context) =>
      CustomPaint(
        painter: BracketPartPainter(thickness),
      );
}

class BracketPartPainter extends CustomPainter with EquatableMixin {
  double thickness;

  BracketPartPainter(this.thickness);

  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width, h = size.height;
    var strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;
    var fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;
    var path = Path()
      ..moveTo(w, h)
      ..lineTo(0,h)
      ..lineTo(0,0)
      ..lineTo(thickness,0)
      ..lineTo(thickness,h-thickness)
      ..lineTo(w,h-thickness)
      ..close()

    ;
    canvas.drawPath(path, strokePaint);
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant BracketPartPainter oldDelegate) =>
      oldDelegate == this;

  @override
  List<Object?> get props => [thickness];
}
class BracketEnd extends StatelessWidget{
  final double thickness;

  const BracketEnd({this.thickness=1, super.key});

  @override
  Widget build(BuildContext context) =>
      CustomPaint(
        painter: BracketEndPainter(thickness),
      );
}

class BracketEndPainter extends CustomPainter with EquatableMixin {
  double thickness;

  BracketEndPainter(this.thickness);

  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width, h = size.height;
    var strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;
    var fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;
    var path = Path()
      ..moveTo(w, 0)
      ..lineTo(0,0)
      ..lineTo(0,h)
      ..lineTo(thickness,h)
      ..lineTo(thickness,thickness)
      ..lineTo(w,thickness)
      ..close()

    ;
    canvas.drawPath(path, strokePaint);
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant BracketPartPainter oldDelegate) =>
      oldDelegate == this;

  @override
  List<Object?> get props => [thickness];
}
class Bracket extends StatelessWidget{
  final double thickness;

  const Bracket({this.thickness=1, super.key});

  @override
  Widget build(BuildContext context) =>
      CustomPaint(
        painter: BracketPainter(thickness),
      );

}

class BracketPainter extends CustomPainter with EquatableMixin {
  double thickness;

  BracketPainter(this.thickness);

  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width, h = size.height;
    var strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;
    var fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;
    var path = Path()
      ..moveTo(w, 0)
      ..lineTo(0,0)
      ..lineTo(0,h)
      ..lineTo(w,h)
      ..lineTo(w,h-thickness)
      ..lineTo(thickness,h-thickness)
      ..lineTo(thickness,thickness)
      ..lineTo(w,thickness)
      ..close()
    ;
    canvas.drawPath(path, strokePaint);
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant BracketPartPainter oldDelegate) =>
      oldDelegate == this;

  @override
  List<Object?> get props => [thickness];
}
