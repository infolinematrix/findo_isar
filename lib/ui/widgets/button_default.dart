import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  const ButtonDefault(
      {Key? key, required this.text, this.color, required this.onTap})
      : super(key: key);

  final Widget text;
  final Color? color;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () => onTap!(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              color ?? Theme.of(context).primaryColorDark),
          elevation: MaterialStateProperty.all<double>(0.25),
          textStyle: MaterialStateProperty.resolveWith((states) {
            return TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              fontSize: 16,
              color: Theme.of(context).colorScheme.background,
            );
          }),
        ),
        // style: ElevatedButton.styleFrom(
        //   textStyle: const TextStyle(
        //     fontSize: 16,
        //     letterSpacing: 1.25,
        //     height: 3.5,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        child: text,
      ),
    );
  }
}
