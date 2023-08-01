import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onSubmitted;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 40,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
      ),
    );
  }
}
