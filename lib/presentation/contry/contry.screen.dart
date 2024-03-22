import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/contry.controller.dart';

class ContryScreen extends GetView<ContryController> {
  const ContryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContryScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContryScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
