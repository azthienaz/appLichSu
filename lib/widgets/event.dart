import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Widget'),
      ),
      body: const Center(
        child: Text('This is the Event Widget'),
      ),
    );
  }
}
