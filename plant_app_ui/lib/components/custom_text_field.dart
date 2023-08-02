import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app_ui/constants.dart';

// Lớp Widget tùy chỉnh cho ô văn bản có giao diện tùy chỉnh.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText, // Văn bản gợi ý hiển thị khi ô văn bản trống.
    required this.icon, // Biểu tượng (icon) hiển thị bên trái ô văn bản.
    this.obscureText = false, // Xác định xem ô văn bản có ẩn văn bản (password) hay không.
    required this.keyboardType, // Loại bàn phím hiển thị khi ô văn bản được tạo.
    required this.onChanged, // Hàm callback được gọi khi nội dung của ô văn bản thay đổi.
    Key? key,
  }) : super(key: key);

  final String hintText; // Văn bản gợi ý hiển thị khi ô văn bản trống.
  final IconData icon; // Biểu tượng (icon) hiển thị bên trái ô văn bản.
  final bool obscureText; // Xác định xem ô văn bản có ẩn văn bản (password) hay không.
  final TextInputType keyboardType; // Loại bàn phím hiển thị khi ô văn bản được tạo.
  final Function(String) onChanged; // Hàm callback được gọi khi nội dung của ô văn bản thay đổi.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
      child: TextField(
        cursorColor: kDarkGreenColor, // Đặt màu của con trỏ (caret) khi người dùng nhập liệu.
        obscureText: obscureText, // Xác định xem ô văn bản có ẩn văn bản (password) hay không.
        keyboardType: keyboardType, // Đặt loại bàn phím hiển thị khi ô văn bản được tạo.
        style: GoogleFonts.poppins( // Định dạng văn bản trong ô văn bản.
          color: kDarkGreenColor,
          fontWeight: FontWeight.w600,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18.0),
          filled: true,
          fillColor: kGinColor,
          prefixIcon: Icon( // Biểu tượng (icon) hiển thị bên trái ô văn bản.
            icon,
            size: 24.0,
            color: kDarkGreenColor,
          ),
          hintText: hintText, // Văn bản gợi ý hiển thị khi ô văn bản trống.
          hintStyle: GoogleFonts.poppins( // Định dạng văn bản cho gợi ý.
            color: kDarkGreenColor,
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
          ),
          enabledBorder: OutlineInputBorder( // Viền xung quanh ô văn bản khi nó không được chọn.
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: kGinColor),
          ),
          focusedBorder: OutlineInputBorder( // Viền xung quanh ô văn bản khi nó được chọn.
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: kDarkGreenColor),
          ),
        ),
        onChanged: onChanged, // Gán hàm callback để theo dõi và xử lý sự thay đổi nội dung của ô văn bản.
      ),
    );
  }
}
