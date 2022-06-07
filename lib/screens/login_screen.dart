import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call/component/register_button.dart';
import 'package:video_call/component/text_field.dart';
import 'package:video_call/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        body: Obx(() => controller.check.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(() => FixedTextField(
                            key: key,
                            type: TextInputType.emailAddress,
                            label: "Email Address",
                            errorLabel: controller.email.error,
                            function: (v) {
                              controller.changeEmail(v);
                              print(controller.email);
                            },
                          )),
                      Obx(() => FixedTextField(
                            type: TextInputType.name,
                            key: key,
                            label: "Password",
                            errorLabel: controller.password.error,
                            function: (v) {
                              controller.changePassword(v);
                              print(controller.password);
                            },
                          )),
                      const SizedBox(height: 50),
                      RegisterButton(
                        key: key,
                        function: () {
                          controller.log();
                        },
                        label: "Login",
                      ),
                    ],
                  ),
                ),
              )));
  }
}
