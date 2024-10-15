// lib/screens/service_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/service_model.dart';

class ServiceDetailScreen extends StatelessWidget {
  final ServiceModel service;

  ServiceDetailScreen({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(service.icon, size: 100), // Displaying service icon
            SizedBox(height: 20),
            Text(
              service.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              service.description,
              style: TextStyle(fontSize: 16),
            ),
            // Remove price reference here if not included in ServiceModel
          ],
        ),
      ),
    );
  }
}
