import 'package:flutter/material.dart';

class CustomItemWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  final bool isSelected;

  const CustomItemWidget({
    Key? key,
    required this.text,
    required this.imageUrl,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ColorFiltered(
          colorFilter: isSelected
              ? const ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.multiply,
                )
              : const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.saturation,
                ),
          child: Image.asset(imageUrl, width: 100, height: 100),
        ),
        Text(text,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : const Color.fromRGBO(125, 126, 128, 1),
            ))
      ],
    );
  }
}
