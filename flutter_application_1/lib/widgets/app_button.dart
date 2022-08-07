import 'package:flutter/material.dart';

import 'package:flutter_application_1/values/app_styles.dart';

import '../values/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const AppButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: const Offset(3, 6),
                  blurRadius: 6)
            ],
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Text(label,
            style: AppStyles.h5
                .copyWith(color: AppColors.textColor, fontSize: 20)),
      ),
    );
  }
}
