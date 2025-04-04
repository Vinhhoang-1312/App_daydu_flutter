import 'package:day_du_app/presentation/page/intro/createNewPasswordScreen.dart';
import 'package:day_du_app/presentation/page/intro/fogotPassword.dart';
import 'package:day_du_app/presentation/page/intro/intro_manager.dart';
import 'package:day_du_app/presentation/page/intro/otp.dart';
import 'package:day_du_app/presentation/page/intro/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'presentation/page/intro/login_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init(); // Initialize GetStorage
  debugPaintSizeEnabled = false; // Bật chế độ Debug Paint

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ), // Kích thước thiết kế gốc (chiều rộng x chiều cao)
      minTextAdapt: true, // Tự động điều chỉnh kích thước chữ
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(fontFamily: 'Roboto'),
          debugShowCheckedModeBanner: false,
          initialRoute: '/intro',
          getPages: [
            GetPage(name: '/intro', page: () => const IntroManager()),
            GetPage(name: '/login', page: () => const LoginScreen()),
            GetPage(name: '/register', page: () => const RegisterScreen()),
            GetPage(name: '/otp', page: () => const OTPScreen()),
            GetPage(
              name: '/create-new-password',
              page: () => const CreateNewPasswordScreen(),
            ),
            GetPage(
              name: '/forgot-password',
              page: () => const ForgotPasswordScreen(),
            ),
          ],
        );
      },
    );
  }
}
