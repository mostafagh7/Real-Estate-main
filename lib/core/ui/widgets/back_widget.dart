import 'package:flutter/material.dart';
import '../../constant/app_colors/app_colors.dart';
import '../../constant/text_styles/app_text_style.dart';

class BackWidget extends StatelessWidget {
  final Widget? titleWidget;
  final Widget? endWidget;
  final VoidCallback? onBack;
  final String? title;
  final bool existBack;

  const BackWidget({
    super.key,
    this.titleWidget,
    this.title,
    this.onBack,
    this.endWidget,
    this.existBack = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.01,
      ),
      child: Row(
        children: [
          if (existBack)
            InkWell(
              onTap: onBack ?? () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: screenWidth * 0.05, 
              ),
            ),
          const Spacer(),
          titleWidget != null
              ? titleWidget!
              : Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.getBoldStyle(
                    color: AppColors.black1c,
                    fontSize: screenWidth * 0.05, 
                  ),
                ),
          const Spacer(),
          if (endWidget != null) endWidget!,
        ],
      ),
    );
  }
}
