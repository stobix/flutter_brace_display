part of '../brace_display.dart';



class Brace extends StatelessWidget{
  final double thickness;
  final double headPos;
  final Color color;
  const Brace({
    this.thickness=0.3,
    this.headPos = 0.5,
    super.key, required this.color,
  });

  @override
  Widget build(BuildContext context) =>
    CustomPaint(
      painter: BracePainter(thickness, headPos, color),
      // size: Size(50,1),
    );
}


class BracePainter extends CustomPainter {
  final double thickness;
  final double headPos;
  final Color color;
  const BracePainter(this.thickness, this.headPos, this.color);

  /// adds [this.thickness] to the denominator of the x coord
  ///
  /// 1/(4+n) = 1/4*a
  ///
  ///  <=>
  ///
  /// 4/(4+n) = a
  _d(Point<double> p) =>
      Point(p.x*(4/(4+thickness)),p.y);

  @override
  void paint(Canvas canvas, Size size) {
    var strokePaint = Paint()
      ..color=color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;
    var fillPaint = Paint()
      ..color=color
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;
    var upperRight = Point(size.width,0.0);
    var lowerRight = Point(size.width, size.height);
    var headPos = Point(0.0,size.height * this.headPos);

    var p = <Point<double>>[
      upperRight,
      headPos,
      lowerRight
    ];
    var v = <Point<double>>[
      Point(size.width/4,p[0].y),
      Point(3*size.width/4,p[1].y),
      Point(size.width/4,p[2].y),
    ];

    var path = Path()
      ..moveTo(p[0].x, p[0].y)
      ..pcubicTo(
          v[0],
          v[1],
          p[1])
      ..pcubicTo(
          v[1],
          v[2],
          p[2])
      ..pcubicTo(
          _d(v[2]),
          _d(v[1]),
          p[1])
      ..pcubicTo(
          _d(v[1]),
          _d(v[0]),
          p[0])
    ..close()
    ;
    canvas.drawPath(path, strokePaint);
    canvas.drawPath(path, fillPaint);

  }


  @override
  bool shouldRepaint(covariant BracePainter oldDelegate) => thickness != oldDelegate.thickness;

}

extension PathExtension on Path{
  pcubicTo(Point<double> v1, Point<double> v2, Point<double> p) =>
      cubicTo(
          v1.x, v1.y, v2.x, v2.y, p.x, p.y
      );

}