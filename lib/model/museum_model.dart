import 'package:flutter/material.dart';
class MuseumModel {
  const MuseumModel({
    required this.index,
    required this.image,
    required this.title,
  });
  final int index;
  final AssetImage image;
  final String title;
}