import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelectionButton extends StatelessWidget {
  final String imagePath;
  const RoleSelectionButton({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/otpverification');
      },
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            child: Image.asset(imagePath),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
