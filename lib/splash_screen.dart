import 'package:flutter/material.dart';
import 'package:mvvm_app/authorization/user_repository.dart';
import 'package:mvvm_app/authorization/user_view_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs){
      final userRepo = UserRepository(prefs);
      Get.put(UserViewModal(userRepo));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
