import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String text; // Văn bản hiển thị trên nút
  final VoidCallback onPressed; // Hàm xử lý khi nhấn nút
  final Color backgroundColor; // Màu nền của nút
  final Color textColor; // Màu chữ trên nút

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryRed, // Mặc định là màu đỏ
    this.textColor = Colors.white, // Mặc định là màu trắng
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Roboto', // Font chữ Roboto
            fontWeight: FontWeight.w700, // Font-weight 700
            fontSize: 16.sp, // Cỡ chữ 16px
            height: 1.0.h, // Line-height 100%
            letterSpacing: 0.0, // Không có khoảng cách giữa các chữ
            color: textColor, // Màu chữ
            textBaseline: TextBaseline.alphabetic, // Căn chỉnh baseline
          ),
          textAlign: TextAlign.center, // Căn giữa văn bản
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onPressed; // Hàm xử lý khi nhấn nút

  const BackButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyLight, // Màu nền cho nút
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.greyLight, // Màu viền
          width: 1.w, // Độ dày viền
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyDark,
            blurRadius: 4.r, // Độ mờ của bóng
            offset: Offset(0, 2.h), // Vị trí bóng
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.black),
        iconSize: 24.sp, // Kích thước biểu tượng động
        onPressed: onPressed,
      ),
    );
  }
}
