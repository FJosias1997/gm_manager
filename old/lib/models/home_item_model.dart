import 'package:flutter/material.dart';

class HomeItemModel {
  String? title;
  String? subtitle;
  IconData? icon;
  Function(BuildContext)? onTap;

  HomeItemModel({
    this.title,
    this.subtitle,
    this.icon,
    this.onTap,
  });
}
