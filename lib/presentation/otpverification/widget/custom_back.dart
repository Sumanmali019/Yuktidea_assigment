import 'package:flutter/material.dart';

class CrossIconbackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CrossIconbackButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 31,
          height: 31,
          decoration: BoxDecoration(
            color: const Color(0xFF212426),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: const Offset(6, 6),
                blurRadius: 12,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.09),
                offset: const Offset(-6, -6),
                blurRadius: 12,
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white, // Color for the 'X' icon
              size: 18, // Adjust the size of the 'X' icon if needed
            ),
          ),
        ),
      ),
    );
  }
}
