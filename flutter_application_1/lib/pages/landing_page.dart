import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/values/app_assets.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_styles.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome to',
                style: AppStyles.h3,
              ),
            )),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'English',
                      style: AppStyles.h2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyText,
                          fontSize: 80),
                    ),
                    Text(
                      'Quotes"',
                      style: AppStyles.h4.copyWith(height: 0.2),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: RawMaterialButton(
                fillColor: AppColors.secondColor,
                shape: CircleBorder(),
                child: Image.asset(AppAssets.right_arrow),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
