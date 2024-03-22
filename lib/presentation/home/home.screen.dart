import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assessment/presentation/home/controllers/home.controller.dart';
import 'package:yuktidea_assessment/presentation/home/widgets/cutsom_widget.dart';
import 'package:yuktidea_assessment/presentation/otpverification/widget/custom_back.dart';
import 'package:yuktidea_assessment/presentation/otpverification/widget/custon_button.dart';

import '../contryselected/contryselected.screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
        appBar: AppBar(
          leading: CrossIconbackButton(onPressed: () {
            Get.back();
          }),
          backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Select Country',
                  style: TextStyle(
                      fontSize: 24, color: Color.fromRGBO(255, 255, 255, 1))),
            ),
            const SizedBox(
              height: 26,
            ),
            const Text(
              'Please select the country where',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(217, 137, 106, 1),
              ),
            ),
            const Text(
              'you want to study',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(217, 137, 106, 1),
              ),
            ),
            const SizedBox(
              height: 76,
            ),
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: controller.contrylist.length,
                  itemBuilder: (context, index) {
                    final item = controller.contrylist[index];
                    return GestureDetector(
                      onTap: () => controller.toggleItemSelection(item['id']),
                      child: CustomItemWidget(
                        text: item['text'],
                        imageUrl: item['imageUrl'],
                        isSelected: item['isSelected'],
                      ),
                    );
                  },
                );
              }),
            ),
            Obx(() {
              var isItemSelected = controller.contrylist
                  .any((item) => item['isSelected'] == true);
              return CustomButton(
                onTap: isItemSelected
                    ? () {
                        var selectedItem = controller.contrylist.firstWhere(
                          (item) => item['isSelected'] == true,
                        );

                        print('Selected: ${selectedItem['text']}');
                        Get.to(ContryselextedScreen());
                      }
                    : null,
                color: isItemSelected
                    ? const Color.fromRGBO(249, 211, 180, 1)
                    : const Color.fromRGBO(249, 211, 180, 0.4),
                buttonText: 'Proceed',
              );
            }),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Can’t see the country of your interest?',
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(255, 255, 255, 1)),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Consult with us',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(217, 137, 106, 1),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ));
  }
}
