import 'dart:async';

import 'package:get/get.dart';
import 'package:mvvm_app/authorization/home_screen.dart';
import 'package:mvvm_app/authorization/login_form_view.dart';
import 'package:mvvm_app/authorization/user_repository.dart';

class UserViewModal extends GetxController{
  UserViewModal(UserRepository userRepository):_userRepository=userRepository;
  final UserRepository _userRepository;
  final RxBool isLoggedIn = RxBool(false);
  String userName='';
  late final StreamSubscription<bool> _loginStateStreamSubs;
  @override
  void onInit() {
    super.onInit();
    _loginStateStreamSubs = isLoggedIn.listen((value) {
      if(value){
        Get.offAll(()=> HomeScreen());
      }else{
        Get.offAll(()=> LoginFormView());
      }
    });
    isLoggedIn.value = _userRepository.isLoggedIn;
    userName = _userRepository.name??'';
  }
  Future<void> login()async{
    isLoggedIn.value = await _userRepository.login(userName);
  }
  Future<void> logout()async{
    await _userRepository.logOut();
    isLoggedIn.value=false;
    print("logged out");
  }

  @override
  void onClose() {
    super.onClose();
    _loginStateStreamSubs.cancel();
  }
}