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
            color: const Color.fromRGBO(41, 41, 41, 1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.3),
                offset: const Offset(-4, -2),
                blurRadius: 4,
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
