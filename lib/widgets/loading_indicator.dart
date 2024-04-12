import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double width;
  final double height;
  const LoadingIndicator({super.key, this.width = 50, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
