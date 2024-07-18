import 'package:flutter/material.dart';

class PeriodDetailPage extends StatelessWidget {
  const PeriodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period Detail'),
      ),
      body: const Center(
        child: Text('This is the Period Detail'),
      ),
    );
  }
}
