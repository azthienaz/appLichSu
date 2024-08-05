import 'package:flutter/material.dart';

class TodayModel {
  const TodayModel({
    required this.image,
    required this.title,
    required this.name,
  });
  final AssetImage image;
  final String title;
  final String name;
}
