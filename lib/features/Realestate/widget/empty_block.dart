import 'package:flutter/material.dart';
import 'package:real_estate/core/constant/app_padding/app_padding.dart';

class EmptyBlock extends StatelessWidget {
  const EmptyBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppPaddingSize.padding_100,
            height: AppPaddingSize.padding_100,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: AppPaddingSize.padding_20,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: AppPaddingSize.padding_20,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: AppPaddingSize.padding_20,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
