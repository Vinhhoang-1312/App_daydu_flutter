import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroContent extends StatelessWidget {
  final String imagePath;
  final String title;

  const IntroContent({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.75, // 3/4 màn hình
      height: 0.75.sh, // 3/4 chiều cao màn hình

      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Hình ảnh
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 250.h, // Giới hạn chiều cao của hình ảnh
              child: Image.asset(
                imagePath,
                fit:
                    BoxFit
                        .contain, // Đảm bảo hình ảnh không vượt quá kích thước
              ),
            ),
          ),
          // Tiêu đề
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp, // Font-size động
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
