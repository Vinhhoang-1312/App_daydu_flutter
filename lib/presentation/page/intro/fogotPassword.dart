import 'package:day_du_app/presentation/widgets/intro/custom_button.dart';
import 'package:day_du_app/presentation/widgets/intro/form_register.dart';
import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'otp.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();
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
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.greyLight, // Màu nền cho nút
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.greyLight, // Màu viền
                    width: 1, // Độ dày viền
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyDark,
                      blurRadius: 4, // Độ mờ của bóng
                      offset: const Offset(0, 2), // Vị trí bóng
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Quay lại màn hình trước đó
                  },
                ),
              ),
            ),
            //phần nhập mã OTP
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
                            "Quên mật khẩu ?",
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
                        "Có phải bạn đã quên mật khẩu ? Đừng lo lắng, vui lòng nhập số điện thoại đã đăng ký.",
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
                      // ForgotPassword form
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color(0xFFC62E2E),
                          ),
                          hintText: "Nhập số điện thoại",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
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
                      const SizedBox(height: 50),
                      // Nút gửi mã
                      PrimaryButton(
                        text: "Gửi mã",
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
            //Nhớ mật khẩu, đăng nhập
            Positioned(
              bottom: 20, // Cách đáy màn hình 20px
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyLight, // Màu nền cho nút
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.greyLight, // Màu viền
                      width: 1, // Độ dày viền
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyDark,
                        blurRadius: 4, // Độ mờ của bóng
                        offset: const Offset(0, 2), // Vị trí bóng
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ), // Thêm padding cho văn bản
                  child: GestureDetector(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                        text: "Nhớ mật khẩu ? ", // Phần đầu của văn bản
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color:
                              AppColors
                                  .black, // Màu đen cho phần "Nhớ mật khẩu?"
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Đăng nhập", // Phần "Đăng nhập"
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  AppColors
                                      .primaryRed, // Màu đỏ cho chữ "Đăng nhập"
                              decoration:
                                  TextDecoration
                                      .underline, // Gạch chân chữ "Đăng nhập"
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      '/login',
                                    ); // Điều hướng đến màn hình đăng nhập
                                  },
                          ),
                        ],
                      ),
                    ),
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
