import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/service_model.dart';
import '../providers/order_provider.dart';
import '../widgets/service_card.dart';
import 'service_selection_screen.dart'; // Import the new screen
import 'history_screen.dart'; // Import history screen
import 'profile_screen.dart'; // Import profile screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of specific services
  final List<ServiceModel> services = [
    ServiceModel(
      id: '1',
      name: 'Plumbing',
      description: 'Fix your plumbing issues.',
      icon: Icons.plumbing,
      price: 100.0,
    ),
    ServiceModel(
      id: '2',
      name: 'Gardening',
      description: 'Beautiful garden services.',
      icon: Icons.local_florist,
      price: 150.0,
    ),
    ServiceModel(
      id: '3',
      name: 'Cleaning',
      description: 'House cleaning services.',
      icon: Icons.cleaning_services,
      price: 80.0,
    ),
    ServiceModel(
      id: '4',
      name: 'Electrical',
      description: 'Electrical installation and repair.',
      icon: Icons.electric_car,
      price: 120.0,
    ),
    ServiceModel(
      id: '5',
      name: 'Carpentry',
      description: 'Woodwork and repair services.',
      icon: Icons.car_repair,
      price: 200.0,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider =
        Provider.of<OrderProvider>(context); // Removed unused warning

    return Scaffold(
      appBar: AppBar(
        // Cool gradient in AppBar
        title: Text(
          'Home Services',
          style: TextStyle(
            fontSize: 20,
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
      body: _selectedIndex == 0
          ? Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final service = services[index];

                      return ServiceCard(
                        service: service,
                        onBook: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ServiceSelectionScreen(service: service),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          : _selectedIndex == 1
              ? HistoryScreen() // Navigate to History Screen
              : ProfileScreen(), // Navigate to Profile Screen

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}
