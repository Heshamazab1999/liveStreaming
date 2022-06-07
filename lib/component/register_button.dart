import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key, this.function, this.label}) : super(key: key);
  final String? label;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(220, 60),
          primary: Colors.teal,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      child: Text(
        label!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
