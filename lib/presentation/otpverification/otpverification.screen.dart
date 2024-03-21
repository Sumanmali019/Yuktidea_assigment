import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assessment/presentation/otpverification/controllers/otpverification.controller.dart';
import '../../infrastructure/dal/models/country.dart';

class OtpverificationScreen extends GetView<OtpverificationController> {
  final ScrollController _scrollController = ScrollController();

  OtpverificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.orange,
                ),
                filled: true,
                fillColor:
                    Colors.grey[800], // Adjust the color to match your theme
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white), // Adjust text color
              onChanged: controller.filterCountries,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.filteredCountries.isEmpty) {
                return const Center(child: Text("No countries found"));
              } else {
                return ListView.separated(
                  controller: _scrollController,
                  itemCount: controller.filteredCountries.length,
                  separatorBuilder: (context, index) =>
                      Divider(color: theme.dividerColor),
                  itemBuilder: (context, index) {
                    Country country = controller.filteredCountries[index];
                    return ListTile(
                      leading: SvgPicture.network(
                        country.flag,
                        width: 32,
                        height: 20,
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                      title: Text(
                        country.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        country.telCode,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Get.toNamed('/optscreen');
                      },
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
