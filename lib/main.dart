import 'package:day_du_app/presentation/page/intro/intro_manager.dart';
import 'package:day_du_app/presentation/page/intro/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'presentation/page/intro/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  // Register controllers and services globally
  // Get.put(AuthController());
  // Get.put(AuthService());
  // Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro',
      getPages: [
        GetPage(name: '/intro', page: () => const IntroManager()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        // GetPage(name: '/home', page: () => const HomeScreen()),
      ],
    );
  }
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Example middleware logic
    // final AuthController authController = Get.find<AuthController>();
    // if (!authController.isLoggedIn.value) {
    //   return const RouteSettings(name: '/login');
    // }
    return null;
  }
}
