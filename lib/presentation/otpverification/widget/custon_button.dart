import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;

  const CustomButton({
    Key? key,
    this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192,
      height: 59,
      decoration: BoxDecoration(
        color: const Color(0xFF212426), // Dark background color
        borderRadius: BorderRadius.circular(100), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16), // Shadow color
            offset: const Offset(6, 6), // Shadow position
            blurRadius: 12, // Shadow blur radius
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.04), // White glow color
            offset: const Offset(-6, -6), // White glow position
            blurRadius: 12, // White glow blur radius
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Color.fromRGBO(249, 211, 180, 0.4),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
