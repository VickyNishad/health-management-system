import 'package:flutter/material.dart';

class RequestModel {
  final String id;
  final String name;
  final String date;
  final String purpose;
  final String type;
  final IconData typeIcon;
  final Color typeColor;
  final bool isNew;

  RequestModel({
    required this.id,
    required this.name,
    required this.date,
    required this.purpose,
    required this.type,
    required this.typeIcon,
    required this.typeColor,
    required this.isNew,
  });
}
