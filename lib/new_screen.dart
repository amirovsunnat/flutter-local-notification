import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  final String payload;
  const NewScreen({
    super.key,
    required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Screen",
        ),
      ),
      body: Center(
        child: Text(
          payload,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
