import 'package:flutter/material.dart';
import 'package:mvvm_app/authorization/user_view_modal.dart';
import 'package:get/get.dart';

class LoginFormView extends StatelessWidget {
  LoginFormView({Key? key}) : super(key: key);
  final UserViewModal _userViewModal = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                _userViewModal.userName = value;
              },
            ),
            ElevatedButton(
                onPressed: () => _userViewModal.login(),
                child: const Text(
                  "Login",
                ))
          ],
        ),
      ),
    );
  }
}
