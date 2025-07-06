import 'package:flutter/material.dart';

class elevatedbut extends StatelessWidget {
  elevatedbut({
    super.key,
    required this.label,
    required this.press,
    required this.backColor,
    required this.foregColor,
    required this.ukuran,
  });
  Size ukuran;
  String label;
  void Function() press;
  final Color backColor;
  final Color foregColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        backgroundColor: backColor,
        foregroundColor: foregColor,
        minimumSize: ukuran,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }
}
