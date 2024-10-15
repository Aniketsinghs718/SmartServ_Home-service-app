// lib/models/service_model.dart

import 'package:flutter/material.dart';

class ServiceModel {
  final String id;
  final String name;
  final String description;
  final IconData icon; // Ensure IconData is imported correctly
  final double price; // Add price field

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.price,
  });
}
