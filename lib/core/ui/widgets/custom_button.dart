import 'package:flutter/material.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';

import '../../constant/text_styles/app_text_style.dart';
import '../../constant/text_styles/font_size.dart';


class CustomButton extends StatelessWidget {
 const CustomButton({
    super.key,
    this.w,
    this.color,
    required this.text,
    this.textStyle,
    this.h,
    this.radius,
    this.borderSideColor,
    this.rowChild,
   this.onPressed
  });
  final double? w;
  final double? radius;
  final double? h;
  final Color? color;
  final Color? borderSideColor;
  final TextStyle? textStyle;
  final String? text;
  final Widget? rowChild;
  final VoidCallback? onPressed;

   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: h ?? 48,
        width:  w ?? double.infinity,
        decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(radius ?? 8),
        color:color ?? Theme.of(context).colorScheme.primaryColor,
        border: Border.all(color: borderSideColor ?? Colors.transparent,),),
        child:(rowChild!=null) ? rowChild! : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text!,
                style: textStyle?? AppTextStyle.getMediumStyle(
              color: Theme.of(context).colorScheme.secondaryColor,
                fontSize: AppFontSize.size_16),
                textAlign:  (rowChild!=null)?TextAlign.start:TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}