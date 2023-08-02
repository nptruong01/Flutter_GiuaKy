// Đoạn mã import các gói thư viện cần thiết.
import 'package:flutter/material.dart'; // Thư viện giao diện cơ bản của Flutter.
import 'package:google_fonts/google_fonts.dart'; // Thư viện Google Fonts cho phông chữ.
import 'package:plant_app_ui/constants.dart'; // Tập hợp các hằng số được định nghĩa trong dự án.

// Lớp Widget tùy chỉnh cho nút đăng nhập hoặc đăng ký.
class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    required this.label, // Văn bản hiển thị trên nút.
    required this.onPressed, // Hàm callback sẽ được gọi khi nút được nhấn.
    Key? key,
  }) : super(key: key);

  final String label; // Văn bản hiển thị trên nút.
  final Function() onPressed; // Hàm callback được gọi khi nút được nhấn.

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( // Widget ElevatedButton để tạo nút được nâng cao.
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12.0),
        ),
        backgroundColor: MaterialStateProperty.all(kDarkGreenColor), // Màu nền của nút, sử dụng hằng số kDarkGreenColor.
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Định dạng hình dạng bo tròn cho nút.
        )),
      ),
      onPressed: onPressed, // Gán hàm callback khi nút được nhấn.
      child: Text(
        label, // Hiển thị nội dung của nút, là giá trị của biến 'label'.
        style: GoogleFonts.poppins(fontSize: 16.0), // Định dạng văn bản sử dụng Google Fonts với font-size là 16.0.
      ),
    );
  }
}
