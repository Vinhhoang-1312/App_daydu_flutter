//import 'package:day_du_app/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/intro/splash_content.dart';
import 'dart:ui' as ui;

class IntroManager extends StatefulWidget {
  const IntroManager({super.key});

  @override
  State<IntroManager> createState() => _IntroManagerState();
}

class _IntroManagerState extends State<IntroManager> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> splashContent = [
    {
      "title": "Tiện Lợi Nhu Cầu, Ngay Khu Bạn Sống",
      "image": "assets/images/intro1.png",
    },
    {
      "title": "Phục Vụ Tận Tâm, Giá Cả Minh Bạch",
      "image": "assets/images/intro2.png",
    },
    {
      "title": "Ứng Dụng ĐẦY ĐỦ, Dành Cho Bạn!",
      "image": "assets/images/intro3.png",
    },
  ];

  void onSkip() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void onNext() {
    if (currentIndex < splashContent.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC62E2E), // Màu nền đỏ
      body: Stack(
        children: [
          // Container trắng chiếm 3/4 màn hình phía trên
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30), // Bo góc phía dưới
              ),
              child: Container(
                height:
                    MediaQuery.of(context).size.height *
                    0.75, // Chiều cao 3/4 màn hình
                width: double.infinity,
                color: Colors.white, // Màu trắng của Container
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: splashContent.length,
                  itemBuilder: (context, index) {
                    return SplashContent(
                      title: splashContent[index]["title"]!,
                      image: splashContent[index]["image"]!,
                    );
                  },
                ),
              ),
            ),
          ),
          // SmoothPageIndicator và nút "Bỏ qua"
          Positioned(
            top:
                MediaQuery.of(context).size.height * 0.01, // Đặt dưới Container
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: splashContent.length,
                  effect: const WormEffect(
                    activeDotColor: Color(0xFFC62E2E),
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                currentIndex < splashContent.length - 1
                    ? TextButton(
                      onPressed: onSkip,
                      child: const Text(
                        'Bỏ qua',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                    : TextButton(
                      onPressed: onSkip,
                      child: const Text(
                        'Bắt đầu',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
              ],
            ),
          ),
          // Hình tròn nằm ở giữa với nút black_button.png
          Positioned(
            bottom: 162,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: onNext, // Gọi hàm onNext khi bấm vào nút
                child: Container(
                  height: 85, // Kích thước hình tròn
                  width: 85,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC62E2E), // Màu đỏ
                    shape: BoxShape.circle, // Hình tròn
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.2),
                    //     blurRadius: 10,
                    //     spreadRadius: 2,
                    //   ),
                    // ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/black_button.png', // Đường dẫn đến nút
                      height: 60, // Kích thước nút
                      width: 60,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //Nút "Tiếp theo" hoặc "Bắt đầu"
          Positioned(
            bottom: 40,
            left: (MediaQuery.of(context).size.width - 200) / 2, //căn giữa
            child: GestureDetector(
              onTap: (onNext),
              child: Container(
                height: 56,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25), // Rounded edges
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  currentIndex < splashContent.length - 1
                      ? "Tiếp theo"
                      : "Bắt đầu",
                  style: TextStyle(
                    color: const Color(0xFFC62E2E), // Màu đỏ
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationPainter extends CustomPainter {
  final Color firstGradiantColor;
  final Color secondGradiantColor;

  NavigationPainter({
    required this.firstGradiantColor,
    required this.secondGradiantColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint =
        Paint()
          ..shader = ui.Gradient.linear(
            Offset(0, 0),
            Offset(size.width, size.height),
            [firstGradiantColor, secondGradiantColor],
          )
          ..style = PaintingStyle.fill;

    var path =
        Path()
          ..moveTo(0, size.height * 0.3)
          ..quadraticBezierTo(
            size.width * 0.25,
            size.height * 0.5,
            size.width * 0.5,
            size.height * 0.3,
          )
          ..quadraticBezierTo(
            size.width * 0.75,
            size.height * 0.1,
            size.width,
            size.height * 0.3,
          )
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
