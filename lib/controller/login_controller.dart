import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call/model/validation_model.dart';
import 'package:video_call/screens/video_call_screen.dart';
import 'package:video_call/services/login_services.dart';

class LoginController extends GetxController {
  final _services = LoginServices();
  final _email = Valid().obs;
  final _password = Valid().obs;
  final check = false.obs;

  Valid get email => _email.value;

  Valid get password => _password.value;

  changePassword(String password) {
    if (password.trim().length < 4) {
      _password.value = Valid(error: "Password's length must be more than 4 ");
    } else {
      _password.value = Valid(value: password);
      print(password);
    }
  }

  changeEmail(String email) {
    if (email.trim().length < 4) {
      _email.value = Valid(error: "email length must be more than 4");
    } else {
      _email.value = Valid(value: email);
      print(email);
    }
  }

  log() async {
    check.value = true;
    try {
      if (email.value!.isNotEmpty && password.value!.isNotEmpty) {
        await _services.login(_email.value.value!, _password.value.value!);
        Get.offAll(() => const VideoCall());
      } else {
        check.value = false;
        print("Exception");
        Get.snackbar(
          "in Valid",

          "Enter Data",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      check.value = false;
    } catch (e) {
      Get.snackbar(
        "in Valid",
        "Enter Data",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      check.value = false;
    }
  }
}
