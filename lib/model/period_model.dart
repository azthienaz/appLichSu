import 'package:flutter/material.dart';
class PeriodModel {
  const PeriodModel({
    required this.image,
    required this.period,
    required this.time,
  });

  final AssetImage image;
  final String period;
  final String time;
}