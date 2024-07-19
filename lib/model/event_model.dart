import 'package:flutter/material.dart';
class EventModel {
  const EventModel({
    required this.image,
    required this.title,
    required this.time,
  });

  final AssetImage image;
  final String title;
  final String time;
}