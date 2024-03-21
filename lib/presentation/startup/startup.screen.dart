import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yuktidea_assessment/presentation/startup/widget/role_selection.dart';
import 'package:yuktidea_assessment/presentation/startup/widget/terms_condition.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/svg.gif',
            ),
            SlidingUpPanel(
              color: const Color.fromRGBO(41, 41, 41, 1),
              minHeight: Get.height * 0.36,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              panel: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 42.0),
                    child: Text(
                      'Welcome to Study Lancer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Please select your role to get registered',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoleSelectionButton(
                        imagePath: 'assets/images/student.png',
                      ),
                      SizedBox(height: 16),
                      RoleSelectionButton(
                        imagePath: 'assets/images/agent.png',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'By continuing you agree to our',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => TermsAndConditionsView());
                        },
                        child: const Text(
                          'Terms and Conditions',
                          style: TextStyle(
                            color: Color.fromRGBO(217, 137, 106, 1),
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
