import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yuktidea_assessment/presentation/startup/widget/custom_back.dart';

import '../../../infrastructure/dal/models/terms.dart';
import '../../../infrastructure/dal/services/api_service.dart';

class TermsAndConditionsView extends StatelessWidget {
  final ApiService apiService = ApiService();

  TermsAndConditionsView({super.key});

  String formatDate(String dateStr) {
    DateFormat inputFormat = DateFormat('yyyy-MM-dd - HH:mm:ss');
    DateFormat outputFormat = DateFormat('MM/dd/yyyy');
    DateTime dateTime = inputFormat.parse(dateStr);
    return outputFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
        actions: [
          CrossIconButton(
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
      body: FutureBuilder<TermsAndConditions>(
        future: apiService.getTermsAndConditions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/tearm.png"),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HtmlWidget(
                                '<span style="color: #D9896A;">${(snapshot.data!.title)}</span>',
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              HtmlWidget(
                                  '<span style="color: #7D7E80;">Update ${snapshot.data?.updatedAt}</span>'),
                            ],
                          ),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 25, right: 25),
                      child: HtmlWidget(
                        snapshot.data!.content,
                        customStylesBuilder: (element) {
                          if (element.localName == 'h1') {
                            return {'color': '#D9896A', 'font-size': '18px'};
                          } else if (element.localName == 'p') {
                            return {'color': '#FFFFFF', 'font-size': '14px'};
                          } else if (element.localName == 'ul') {
                            return {'color': '#FFFFFF', 'font-size': '14px'};
                          }
                          return null;
                        },
                      ),
                    )),
                  ],
                ),
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
