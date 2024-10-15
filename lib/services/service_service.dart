import 'package:flutter/material.dart';
import '../models/service_model.dart';

class ServiceService {
  // This is just a sample data source
  List<ServiceModel> getServices() {
    return [
      ServiceModel(
        id: '1',
        name: 'Cleaning Service',
        description: 'Professional cleaning for your home.',
        icon: Icons.cleaning_services,
        price: 50.0,
      ),
      ServiceModel(
        id: '2',
        name: 'Plumbing Service',
        description: 'Expert plumbing services for your needs.',
        icon: Icons.plumbing,
        price: 75.0,
      ),
      ServiceModel(
        id: '3',
        name: 'Electrical Service',
        description: 'Quality electrical repairs and installations.',
        icon: Icons.electrical_services,
        price: 100.0,
      ),
      ServiceModel(
        id: '4',
        name: 'Gardening Service',
        description: 'Professional gardening services for your home.',
        icon: Icons.grass,
        price: 40.0,
      ),
      // Add more services as needed
    ];
  }
}
