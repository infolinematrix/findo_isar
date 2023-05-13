import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).canvasColor,
      ),
      child: child,
    );
  }
}
