import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';

class DropDownWidget<Model> extends StatelessWidget {
  final Model? value;
  final void Function(Model?)? onChanged;
  final List<DropdownMenuItem<Model>>? items;
  final String hint;
  final Model allValue;

  const DropDownWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.hint,
    required this.allValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h, 
      margin: EdgeInsets.symmetric(
        horizontal: 16.w, 
        vertical: 8.h, 
      ),
      child: IntrinsicWidth(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Model>(
            itemHeight: 64.h, 
            isExpanded: true,
            style: TextStyle(
              fontSize: 16.sp, 
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
            hint: Text(
              hint,
              style: TextStyle(fontSize: 16.sp), 
            ),
            padding: EdgeInsets.all(12.w), 
            value: value,
            onChanged: onChanged,
            items: [
              DropdownMenuItem<Model>(
                value: allValue,
                child: const Text('All'),
              ),
              ...items!.map((item) {
                return DropdownMenuItem<Model>(
                  value: item.value,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h), 
                      child: item.child,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
