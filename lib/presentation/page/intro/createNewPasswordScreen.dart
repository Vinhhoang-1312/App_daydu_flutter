import 'package:day_du_app/presentation/widgets/intro/custom_button.dart';
import 'package:day_du_app/presentation/widgets/intro/form_register.dart';
import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'otp.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox.expand(
        // Đảm bảo Stack chiếm toàn bộ màn hình
        child: Stack(
          children: [
            // Nút Back
            Positioned(
              top: 20,
              left: 10,
              child: BackButtonWidget(
                onPressed: () {
                  Navigator.pop(context); // Quay lại màn hình trước đó
                },
              ),
            ),
            //text nhập mật khẩu
            SingleChildScrollView(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ), // Cách đều 20px từ trái và phải
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Căn chỉnh từ trái sang phải
                    children: [
                      const SizedBox(height: 80),
                      // Logo và Tiêu Đề
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start, // Căn chỉnh từ trái sang phải
                        children: [
                          const SizedBox(height: 40),
                          const Text(
                            "Tạo mật khẩu mới",
                            style: TextStyle(
                              fontFamily: 'Roboto', // Đặt font chữ Roboto
                              fontWeight: FontWeight.w600, // Font-weight 500
                              fontSize: 32, // Cỡ chữ
                              height: 1.0, // Dùng để kiểm soát line-height
                              letterSpacing:
                                  0.0, // Không có khoảng cách giữa các chữ
                              textBaseline: TextBaseline.alphabetic,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // tiêu đề phụ ở dưới
                      const Text(
                        "Mật khẩu mới của bạn phải là duy nhất so với mật khẩu đã sử dụng trước đó",
                        style: TextStyle(
                          fontFamily: 'Roboto', // Đặt font chữ Roboto
                          color: AppColors.gray,
                          fontSize: 16, // Cỡ chữ
                          height: 1.5, // Dùng để kiểm soát line-height
                          letterSpacing:
                              0.5, // Không có khoảng cách giữa các chữ
                          textBaseline: TextBaseline.alphabetic,
                        ),
                      ),
                      const SizedBox(height: 50),

                      // Tạo mật khẩu mới form
                      TextField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: AppColors.greyDark,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.greyDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          hintText: "Mật khẩu mới",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.greyLight,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 16,
                          ),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      //Confirm password input
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: AppColors.greyDark,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.greyDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          hintText: "Nhập lại mật khẩu",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.greyLight,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 16,
                          ),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(height: 50),
                      // Nút gửi mã
                      PrimaryButton(
                        text: "Đổi mật khẩu",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OTPScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // ForgotPassword link
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
