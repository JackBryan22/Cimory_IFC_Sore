import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  SignButton({
    super.key,
    required this.label,
    required this.onPress,
    required this.backColor,
  });

  String label;
  void Function() onPress;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(500, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}
