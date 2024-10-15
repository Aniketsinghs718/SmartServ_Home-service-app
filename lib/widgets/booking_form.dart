import 'package:flutter/material.dart';
import '../models/service_model.dart';

class BookingForm extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback onConfirm; // Add callback

  const BookingForm({Key? key, required this.service, required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Book ${service.name}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Address'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Time (HH:MM)'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onConfirm(); // Trigger the onConfirm callback
            },
            child: Text('Confirm Booking'),
          ),
        ],
      ),
    );
  }
}
