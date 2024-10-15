// lib/widgets/service_card.dart

import 'package:flutter/material.dart';
import '../models/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback onBook;

  const ServiceCard({
    Key? key,
    required this.service,
    required this.onBook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onBook,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(service.icon, size: 50), // Display service icon
            SizedBox(height: 8),
            Text(service.name, style: TextStyle(fontSize: 20)),
            SizedBox(height: 4),
            Text(service.description),
          ],
        ),
      ),
    );
  }
}
