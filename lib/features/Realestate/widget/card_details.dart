import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDetails extends StatelessWidget {
  final String text;
  final String text2;
  final IconData? icon;

  const CardDetails({
    super.key,
    required this.text,
    required this.text2,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.w), 
        height: 36.h, 
        child: Card(
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                size: 24.sp, 
              ),
              Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 16.sp, 
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8.w, 
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                        fontSize: 16.sp, 
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
