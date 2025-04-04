import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Logo và Tiêu Đề
            Column(
              children: [
                Image.asset("assets/images/login.png", height: 140),
                const SizedBox(height: 40),
                const Text(
                  "Đăng nhập",
                  style: TextStyle(
                    fontFamily: 'Roboto', // Đặt font chữ Roboto
                    fontWeight: FontWeight.w600, // Font-weight 500
                    fontSize: 26, // Cỡ chữ 26px
                    height:
                        1.0, // Dùng để kiểm soát line-height (tương đương leading-trim)
                    letterSpacing: 0.0, // Không có khoảng cách giữa các chữ
                    textBaseline:
                        TextBaseline.alphabetic, // Đảm bảo căn chỉnh chữ
                  ),
                ),

                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ), // Mặc định màu đen
                    children: [
                      TextSpan(text: "Chào mừng bạn đến với "),
                      TextSpan(
                        text: "Đầy Đủ",
                        style: TextStyle(
                          color: Color(0xFFC62E2E), // Màu đỏ
                          fontWeight: FontWeight.bold, // In đậm (tuỳ chọn)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            // Login form
            // Container nằm ở dưới cùng
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 242, 241, 241),
                      blurRadius: 10,
                      offset: Offset(0, -1),
                    ),
                  ],
                ),
                //bắt đầu tiêu đề và form nhập
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Đảm bảo chiều cao vừa đủ nội dung
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Đăng nhập với số điện thoại",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Phone input
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color(0xFFC62E2E),
                        ),
                        hintText: "Số điện thoại",
                        border: OutlineInputBorder(
                          // Thêm viền để tránh bị mất độ cao
                          borderRadius: BorderRadius.circular(9), // Bo góc nhẹ
                          borderSide: BorderSide.none, // Xóa viền
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, // Tăng chiều cao
                          horizontal: 16, // Cách lề ngang
                        ),
                        isDense: true, // Giúp chữ căn giữa
                      ),
                    ),

                    const SizedBox(height: 10),
                    // Password input
                    TextField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 193, 193, 193),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color.fromARGB(255, 193, 193, 193),
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintText: "Mật khẩu",
                        border: OutlineInputBorder(
                          // Đảm bảo chiều cao giữ nguyên
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, // Tăng chiều cao
                          horizontal: 16, // Cách lề ngang
                        ),
                        isDense: true, // Giúp chữ căn giữa
                      ),
                    ),

                    const SizedBox(height: 10),
                    // Remember me and forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              activeColor: AppColors.primaryRed,
                              onChanged: (value) {},
                            ),
                            const Text("Ghi nhớ tài khoản"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Login button
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Đăng nhập",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot-password');
                          },
                          child: const Text("Quên mật khẩu?"),
                        ),
                      ],
                    ),

                    // Register link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Bạn chưa có tài khoản?"),

                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            "Đăng kí",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
