import 'package:flutter/material.dart';

class IntroContent extends StatelessWidget {
  final String imagePath;
  final String title;

  const IntroContent({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75, // 3/4 màn hình
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Hình ảnh
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 250, // Giới hạn chiều cao của hình ảnh
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
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
