import 'package:flutter/material.dart';
import 'package:flutter_application_1/values/share_keys.dart';
import '../values/app_assets.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double sliderValue = 5;
  SharedPreferences? prefs;

  initDefaultValue() async {
    prefs = await SharedPreferences.getInstance();
    int value = prefs?.getInt(ShareKeys.counter) ?? 5;
    setState(() {
      sliderValue = value.toDouble();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDefaultValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondColor,
        title: Text(
          'Your control',
          textAlign: TextAlign.center,
          style: AppStyles.h3.copyWith(color: Colors.black87, fontSize: 36),
        ),
        leading: InkWell(
          child: Image.asset(AppAssets.left_arrow),
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt(ShareKeys.counter, sliderValue.toInt());
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Text(
              'How much a number word at once',
              style: AppStyles.h5
                  .copyWith(color: AppColors.lightGrey, fontSize: 18),
            ),
            Spacer(),
            Text(
              '${sliderValue.toInt()}',
              style: AppStyles.h1.copyWith(
                  fontSize: 150,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Slider(
                value: sliderValue,
                min: 5,
                max: 100,
                divisions: 95,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                }),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Slide to set',
                style: AppStyles.h5
                    .copyWith(color: AppColors.textColor, fontSize: 19),
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
