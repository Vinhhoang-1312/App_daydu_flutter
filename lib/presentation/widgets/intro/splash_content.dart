import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final String title;
  final String image;

  const SplashContent({super.key, required this.title, required this.image});
  String formatTitle(String text) {
    List<String> words = text.split(" ");
    List<String> lines = [];

    for (int i = 0; i < words.length; i += 4) {
      lines.add(words.sublist(i, (i + 4).clamp(0, words.length)).join(" "));
    }

    return lines.join("\n"); // Xuống dòng sau mỗi 4 từ
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 120), // Khoảng cách từ trên xuống
          Image.asset(
            image,
            height: 300, // Chiều cao của hình ảnh
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 45), // Khoảng cách giữa hình ảnh và tiêu đề
          // Text(
          //   title,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(
          //     fontSize: 22,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black,
          //   ),
          // ),
          Text(
            formatTitle(title),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 20), // Khoảng cách giữa tiêu đề và mô tả
        ],
      ),
    );
  }
}
