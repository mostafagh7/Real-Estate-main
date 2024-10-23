import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';

import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/utils/Navigation/navigation.dart';
import '../../../main.dart';
import 'realestate_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.w),
                    child: SizedBox(
                      height: 0.6.sh, 
                      width: 1.sw,
                      child: Image.asset(
                        "assets/images/intro.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0.01.sh, 
                  right: 0.3.sw, 
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 0.14.sh,
                          width: 0.09.sw, 
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.black, Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: Text(
                            "Real Estate",
                            style: TextStyle(
                              fontSize: 0.04.sw, 
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Center(
              child: Text(
                "Discover dream house from smartphone",
                style: TextStyle(
                  fontSize: 0.06.sw, 
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Center(
                child: Text(
                  "The No. 1 App for searching and finding the most suitable house with you.",
                  style: TextStyle(
                    fontSize: 0.04.sw, 
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: CustomButton(
                h: 0.06.sh,
                radius: 20.w,
                text: "Continue",
                textStyle: TextStyle(
                  fontSize: 0.04.sw, 
                  color: AppColors.white,
                ),
                onPressed: () {
                  Navigation.pushAndRemoveUntil(const RealestateScreen());
                  prefs!.setString("isFirst", "yes");
                },
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Center(
                child: Text(
                  "Developed by Mustafa Ghazlan",
                  style: TextStyle(
                    fontSize: 0.03.sw, 
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
