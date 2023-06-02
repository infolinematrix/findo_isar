import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  const ButtonDefault(
      {Key? key, required this.text, this.color, required this.onTap})
      : super(key: key);

  final String text;
  final Color? color;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () => onTap!(),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColorDark),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(0.25),
          textStyle: MaterialStateProperty.resolveWith((states) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            );
          }),
        ),
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).canvasColor),
        ),
      ),
    );
  }
}
