import 'package:flutter/material.dart';
import 'package:plant_app_ui/constants.dart';

// CustomClipper để cắt ảnh theo đường cong.
class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Di chuyển tới điểm đầu tiên trên đường cong.
    path.lineTo(0, size.height * 0.30);

    // Vẽ đường cong bằng Bezier Quadratic.
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.36,
      size.width * 0.70,
      size.height * 0.30,
    );

    // Di chuyển đến điểm tiếp theo trên đường cong.
    path.lineTo(size.width, size.height * 0.25);

    // Vẽ đoạn đường thẳng từ điểm cuối đến điểm bắt đầu để đóng đường cong.
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // Đóng đường cong.
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// CustomPainter để vẽ đường cong.
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = kSpiritedGreen; // Đặt màu sắc cho đường cong (dùng hằng số từ file constants.dart).
    paint.style = PaintingStyle.fill; // Chọn kiểu vẽ fill (đổ màu).

    var path = Path();

    // Di chuyển tới điểm đầu tiên trên đường cong.
    path.moveTo(0, size.height * 0.70);

    // Vẽ đường cong bằng Bezier Quadratic.
    path.quadraticBezierTo(
      size.width * 0.40,
      size.height * 0.80,
      size.width * 0.75,
      size.height * 0.60,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.48,
      size.width,
      size.height * 0.32,
    );

    // Vẽ đoạn đường thẳng từ điểm cuối đến điểm bắt đầu để đóng đường cong.
    path.lineTo(size.width, 20);
    path.quadraticBezierTo(size.width, 0, size.width - 20, 0);
    path.lineTo(20, 0);
    path.quadraticBezierTo(0, 0, 0, 20);

    // Đóng đường cong.
    path.close();

    // Vẽ đường cong lên canvas.
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CurvePainter oldDelegate) => false;
}
