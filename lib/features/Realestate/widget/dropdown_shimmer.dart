import 'package:flutter/material.dart';

class ShimmerDD extends StatelessWidget {
  const ShimmerDD({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 10,
        color: Colors.white,
      ),
    );
  }
}
