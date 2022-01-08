import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? text;
  const CustomButton({Key? key, this.onPressed, this.text}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool shouldShow = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: 80,
        decoration: BoxDecoration(
            border: Border(
                bottom: shouldShow
                    ? const BorderSide(color: Color(0xff0ee6b7))
                    : const BorderSide(color: Colors.transparent))),
        child: TextButton(
          onHover: (value) => setState(() => shouldShow = value),
          onPressed: widget.onPressed,
          child: Text(
            widget.text!,
            style: GoogleFonts.lobster(fontSize: 16,
                color: shouldShow ? Colors.white : Colors.white60),
          ),
        ),
      ),
    );
  }
}
