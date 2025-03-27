import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _apartmentTypeController =
      TextEditingController();
  final TextEditingController _apartmentCodeController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isObscure = true;

  // Biến trạng thái để lưu giá trị được chọn từ Dropdown
  String? _selectedApartmentType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: const BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phone input
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone, color: Color(0xFFC62E2E)),
              hintText: "Số điện thoại",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              isDense: true,
            ),
          ),
          const SizedBox(height: 8),
          // Dropdown chọn căn hộ
          DropdownButtonFormField<String>(
            value: _selectedApartmentType, // Giá trị hiện tại
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/icons/choncanho.png', // Đường dẫn đến icon
                  width: 10, // Kích thước icon
                  height: 10,
                ),
              ),
              hintText: "Chọn căn hộ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              isDense: true,
            ),
            items: const [
              DropdownMenuItem(value: "1 PN", child: Text("Căn hộ 1 PN")),
              DropdownMenuItem(value: "1 PN+", child: Text("Căn hộ 1 PN+")),
              DropdownMenuItem(value: "2 PN", child: Text("Căn hộ 2 PN")),
              DropdownMenuItem(value: "2 PN+", child: Text("Căn hộ 2 PN+")),
              DropdownMenuItem(value: "3 PN", child: Text("Căn hộ 3 PN")),
              DropdownMenuItem(
                value: "Căn hộ Studio",
                child: Text("Căn hộ Studio"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _selectedApartmentType = value; // Lưu giá trị được chọn
                _apartmentCodeController.text =
                    value ?? ""; // Cập nhật vào controller
              });
            },
          ),
          const SizedBox(height: 8),
          // Mã căn hộ input
          TextField(
            controller: _apartmentCodeController, // Controller cho mã căn hộ
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/icons/macanho.png', // Đường dẫn đến  icon
                  width: 10, // Kích thước icon
                  height: 10,
                ),
              ),
              hintText: "Mã căn hộ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              isDense: true,
            ),
          ),
          const SizedBox(height: 8),
          // Họ và tên input
          TextField(
            controller: _fullNameController, // Controller cho mã căn hộ
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person, // Biểu tượng person
                color: AppColors.greyDark,
              ),
              hintText: "Họ tên",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              isDense: true,
            ),
          ),
          const SizedBox(height: 8),
          // Password input
          TextField(
            controller: _passwordController,
            obscureText: _isObscure,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock, color: AppColors.greyDark),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.greyDark,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
              hintText: "Mật khẩu",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.white,
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
              prefixIcon: const Icon(Icons.lock, color: AppColors.greyDark),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
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
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              isDense: true,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
