import 'package:day_du_app/presentation/widgets/intro/form_register.dart';
import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Logo và Tiêu Đề
            Column(
              children: [
                Image.asset("assets/images/register.png", height: 140),
                const SizedBox(height: 40),
                const Text(
                  "Tạo tài khoản",
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
              ],
            ),
            const SizedBox(height: 50),
            // Register form
            // Container nằm ở dưới cùng
            const RegisterForm(),

            const SizedBox(height: 10),

            // Register button
            SizedBox(
              width: 324.97540283203125,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý đăng nhập
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Tạo tài khoản",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Register link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
