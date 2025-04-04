import 'package:day_du_app/presentation/widgets/intro/custom_button.dart';
import 'package:day_du_app/presentation/widgets/intro/form_register.dart';
import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import 'package:flutter/gestures.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

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
            //phần nhập số điện thoại
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
                            "Xác nhận mã OTP",
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
                      //Tiêu đề phụ
                      const Text(
                        "Nhập mã xác minh chúng tôi vừa gửi vào số điện thoại của bạn.",
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

                      // OTP form nhập 4 số
                      Container(
                        padding: EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _textFieldOTP(
                                  context: context,
                                  first: true,
                                  last: false,
                                  controller: otpController1,
                                ),
                                _textFieldOTP(
                                  context: context,
                                  first: false,
                                  last: false,
                                  controller: otpController2,
                                ),
                                _textFieldOTP(
                                  context: context,
                                  first: false,
                                  last: false,
                                  controller: otpController3,
                                ),
                                _textFieldOTP(
                                  context: context,
                                  first: false,
                                  last: true,
                                  controller: otpController4,
                                ),
                              ],
                            ),
                            SizedBox(height: 22),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      // OTP button
                      PrimaryButton(
                        text: "Xác nhận",
                        onPressed: () {
                          // Xử lý khi nhấn nút
                          print("Xác nhận mã");
                        },
                      ),
                      const SizedBox(height: 20),

                      // OTP link
                    ],
                  ),
                ),
              ),
            ),
            //Bạn không nhận được mã ? Gửi lại
            Positioned(
              bottom: 20, // Cách đáy màn hình 20px
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white, // Màu nền cho nút
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.greyLight, // Màu viền
                      width: 1, // Độ dày viền
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ), // Thêm padding cho văn bản
                  child: GestureDetector(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                        text:
                            "Bạn không nhận được mã ? ", // Phần đầu của văn bản
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color:
                              AppColors
                                  .black, // Màu đen cho phần "Nhớ mật khẩu?"
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: " Gửi lại", // Phần "Đăng nhập"
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  AppColors
                                      .primaryRed, // Màu đỏ cho chữ "Đăng nhập"
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      '/create-new-password',
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

Widget _textFieldOTP({
  required BuildContext context, // Nhận BuildContext để điều khiển focus
  required bool first, // Xác định ô nhập này có phải ô đầu tiên không
  required bool last, // Xác định ô nhập này có phải ô cuối cùng không
  required TextEditingController controller, // Controller để theo dõi giá trị
}) {
  return Container(
    height: 70, // Đặt chiều cao cố định cho ô nhập
    child: AspectRatio(
      aspectRatio: 1.0, // Giữ tỷ lệ chiều rộng = chiều cao (ô vuông)
      child: TextField(
        controller: controller, // Gắn controller cho ô nhập
        autofocus: true, // Khi màn hình mở, tự động focus vào ô nhập đầu tiên
        onChanged: (value) {
          // Nếu người dùng nhập 1 số và ô này không phải ô cuối => Chuyển sang ô kế tiếp
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          // Nếu người dùng xóa số và ô này không phải ô đầu => Quay lại ô trước
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false, // Ẩn con trỏ nhấp nháy
        readOnly: false, // Cho phép nhập liệu
        textAlign: TextAlign.center, // Căn giữa số trong ô
        style: const TextStyle(
          fontSize: 24, // Kích thước chữ lớn
          fontWeight: FontWeight.bold, // Chữ đậm
        ),
        keyboardType: TextInputType.number, // Hiển thị bàn phím số khi nhập
        maxLength: 1, // Chỉ cho phép nhập 1 số vào ô
        decoration: InputDecoration(
          counter: const Offstage(), // Ẩn bộ đếm ký tự
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color:
                  controller.text.isNotEmpty
                      ? AppColors
                          .primaryRed // Màu đỏ nếu đã nhập
                      : AppColors.greyDark, // Màu xám nếu chưa nhập
            ),
            borderRadius: BorderRadius.circular(12), // Bo tròn góc viền
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppColors.primaryRed, // Màu đỏ khi focus
            ),
            borderRadius: BorderRadius.circular(12), // Bo tròn góc viền
          ),
        ),
      ),
    ),
  );
}
