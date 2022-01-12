import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? image;
  final Color? color;
  const ImageButton(
    this.image, {
    Key? key,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Entry.opacity(
      duration: const Duration(seconds: 2),
      delay: const Duration(milliseconds: 800),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          child:
              Image.asset(image!, height: 28, color: color, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
