import 'package:flutter/material.dart';

class LoadingProgressIndicator extends StatelessWidget {
  final String loadingText;

  const LoadingProgressIndicator({
    super.key,
    required this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      const CircularProgressIndicator(),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(loadingText,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  decoration: TextDecoration.none))),
    ]);
  }
}
