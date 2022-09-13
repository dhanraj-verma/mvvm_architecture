import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_app/authorization/user_view_modal.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final UserViewModal _userViewModal = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          TextButton(onPressed: ()=>_userViewModal.logout(), child: const Text("LogOut",style: TextStyle(color: Colors.white)))
        ],
      ),
      body:  Center(
        child: Text(_userViewModal.userName),
      ),
    );
  }
}
