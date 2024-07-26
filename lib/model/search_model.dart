import 'package:flutter/material.dart';
class SearchModel {
  const SearchModel({
    required this.index,
    required this.image,
    required this.title,
  });
  final int index;
  final AssetImage image;
  final String title;
}