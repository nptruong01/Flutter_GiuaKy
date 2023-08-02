import 'package:flutter/material.dart';

// Lớp Widget tùy chỉnh cho thanh điều hướng dưới cùng (bottom navigation bar).
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex, // Chỉ số của biểu tượng (icon) đã được chọn.
    required this.selectedColor, // Màu sắc của biểu tượng đã được chọn.
    required this.unselectedColor, // Màu sắc của các biểu tượng chưa được chọn.
    required this.onTapped, // Hàm callback sẽ được gọi khi người dùng nhấn vào một biểu tượng.
    required this.items, // Danh sách các biểu tượng hiển thị trên thanh điều hướng.
  }) : super(key: key);

  final int selectedIndex; // Chỉ số của biểu tượng (icon) đã được chọn.
  final Color selectedColor; // Màu sắc của biểu tượng đã được chọn.
  final Color unselectedColor; // Màu sắc của các biểu tượng chưa được chọn.
  final Function(int) onTapped; // Hàm callback được gọi khi người dùng nhấn vào một biểu tượng, nhận vào chỉ số của biểu tượng.
  final List<Icon> items; // Danh sách các biểu tượng hiển thị trên thanh điều hướng.

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2), // Thời gian thực hiện chuyển tiếp khi có sự thay đổi thuộc tính.
      height: 90.0, // Chiều cao của thanh điều hướng.
      // margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white, // Màu nền của thanh điều hướng.
        borderRadius: BorderRadius.circular(40.0), // Định dạng hình dạng bo tròn cho thanh điều hướng.
        boxShadow: [
          // Hiệu ứng đổ bóng của thanh điều hướng.
          BoxShadow(
            offset: const Offset(-2, -1),
            color: Colors.grey.shade300,
            blurRadius: 10.0,
            spreadRadius: 1,
          ),
          BoxShadow(
            offset: const Offset(2, 0),
            color: Colors.grey.shade300,
            blurRadius: 10.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Tạo các biểu tượng (icon) dựa trên danh sách 'items'.
            for (int i = 0; i < items.length; i++)
              IconButton(
                icon: items[i], // Icon thứ i trong danh sách 'items'.
                iconSize: 35.0, // Kích thước của biểu tượng (icon).
                color: selectedIndex == i ? selectedColor : unselectedColor, // Xác định màu sắc của biểu tượng dựa vào chỉ số đã được chọn.
                onPressed: () {
                  onTapped(i); // Gọi hàm callback 'onTapped' khi người dùng nhấn vào biểu tượng, truyền vào chỉ số của biểu tượng đã được chọn.
                },
              ),
          ],
        ),
      ),
    );
  }
}
