import 'package:flutter/material.dart';
import 'package:guliver/add_vehicles.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Image.asset(
            'assets/guliva_icon.png', // Replace with your actual image path
            height: 150,
            width: 150,
            fit: BoxFit.contain,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vehicles/Passengers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 15),
              const TabBar(
                tabs: [
                  Tab(text: 'Vehicles'),
                  Tab(text: 'Passengers'),
                ],
                labelColor: Colors.black, // Customize the color as needed
                indicatorColor: Colors.blue, // Customize the color as needed
              ),
              const SizedBox(height: 15),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          const Icon(
                            Icons.lock,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'No vehicle Available',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const AddVehicles()));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue, // Text color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16), // Padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Rounded corners
                              ),
                              elevation: 5, // Elevation (shadow)
                            ),
                            child: const Text(
                              'ADD VEHICLES',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ), // Vehicle tab content
                    const SingleChildScrollView(
                        child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Icon(
                            Icons.lock,
                            size: 50,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'No vehicle Available',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )), // Passenger tab content
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
