import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../models/service_provider_model.dart';
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
        name: 'Vishal Yadav',
        cost: 120,
        phoneNumber: '+91 9769671611',
        rating: 4.8,
      ),
      ServiceProviderModel(
        name: 'Sourabh Sharma',
        cost: 90,
        phoneNumber: '8263042688',
        rating: 3.5,
      ),
      ServiceProviderModel(
        name: 'Tushar Godge',
        cost: 80,
        phoneNumber: '8955454188',
        rating: 4.1,
      ),
      // Add more providers as needed
    ];

    return Scaffold(
      appBar: AppBar(
        // Custom AppBar with gradient and smaller font
        title: Text(
          'Choose a Service Provider',
          style: TextStyle(
            fontSize: 18, // Smaller font size for a sleek look
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: providers.length,
          itemBuilder: (context, index) {
            final provider = providers[index];
            return GestureDetector(
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
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            provider.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.attach_money, color: Colors.green),
                          SizedBox(width: 5),
                          Text(
                            'Cost: ₹${provider.cost}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.blue),
                          SizedBox(width: 5),
                          Text(
                            'Phone: ${provider.phoneNumber}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 5),
                          Text(
                            'Rating: ${provider.rating}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
