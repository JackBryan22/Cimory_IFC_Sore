import 'package:flutter/material.dart';

class profbut extends StatelessWidget {
  profbut({
    super.key,
    required this.label,
    required this.onPress,
    required this.ikon,
  });

  String label;
  void Function() onPress;
  final ikon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(ikon, color: Theme.of(context).iconTheme.color),
                SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).iconTheme.color,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
