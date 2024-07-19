import 'package:flutter/material.dart';
class AnecdoteModel {
  const AnecdoteModel({
    required this.image,
    required this.title,
  });

  final AssetImage image;
  final String title;
}