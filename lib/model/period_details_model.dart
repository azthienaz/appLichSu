import 'package:flutter/material.dart';
class PeriodDetailsModel {
  const PeriodDetailsModel({
    required this.image,
    required this.title,
    required this.time,
  });
  final AssetImage image;
  final String title;
  final String time;
}