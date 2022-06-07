import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class FixedTextField extends StatelessWidget {
  const FixedTextField(
      {Key? key, this.label, this.function, this.type, this.errorLabel})
      : super(key: key);
  final String? label;
  final Function(String)? function;
  final TextInputType? type;
  final String? errorLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.0),
      child: Column(
        children: [
          TextFormField(
            keyboardType: type,
            onChanged: function,
            showCursor: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                label: Text(
                  label!,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          if (errorLabel != null && errorLabel!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ShowUpAnimation(
                child: Text(
                  '$errorLabel',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.redAccent[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
