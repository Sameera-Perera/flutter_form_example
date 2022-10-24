import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final String title;
  final Widget child;
  const InputFormField({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 4,),
        child
      ],
    );
  }
}
