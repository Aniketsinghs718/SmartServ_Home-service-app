import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../models/service_provider_model.dart'; // Create this model for service provider details
import 'booking_screen.dart';

class ServiceSelectionScreen extends StatelessWidget {
  final ServiceModel service;

  const ServiceSelectionScreen({Key? key, required this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample list of service providers (replace with actual data)
    final List<ServiceProviderModel> providers = [
      ServiceProviderModel(
        name: 'Provider 1',
        cost: 100,
        phoneNumber: '123-456-7890',
        rating: 4.5,
      ),
      ServiceProviderModel(
        name: 'Provider 2',
        cost: 150,
        phoneNumber: '098-765-4321',
        rating: 4.0,
      ),
      // Add more providers as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Service Provider'),
      ),
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final provider = providers[index];
          return ListTile(
            title: Text(provider.name),
            subtitle: Text(
                'Cost: \$${provider.cost}\nPhone: ${provider.phoneNumber}\nRating: ${provider.rating}'),
            onTap: () {
              // Navigate to the booking screen with the selected provider
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingScreen(
                    service: service,
                    serviceProvider: provider, // Pass the selected provider
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
