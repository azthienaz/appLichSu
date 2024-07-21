import 'package:flutter/material.dart';
class BookmarkModel {
  const BookmarkModel({
    required this.image,
    required this.title,
  });

  final AssetImage image;
  final String title;
}