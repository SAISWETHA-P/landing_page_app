import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'confirm_order.dart'; // Import the Confirm Order page

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // Sample list of cities & states for search suggestions
  final List<String> cities = [
    "Madurai", "Tirupur", "Coimbatore", "Chennai", "Mysuru", "Mumbai"
  ];
  final List<String> states = [
    "Tamil Nadu", "Karnataka", "Kerala", "Maharashtra"
  ];

  List<String> citySuggestions = [];
  List<String> stateSuggestions = [];

  // Fetch live location
  Future<void> _getLiveLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      locationController.text =
      "Lat: ${position.latitude}, Lng: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Collection Address"),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Where should we collect your recyclables?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Collection Address
            Text("Collection Address"),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Street Address",
              ),
            ),
            SizedBox(height: 16),

            // City & State Fields
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City"),
                      SizedBox(height: 8),
                      TextField(
                        controller: cityController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter City",
                        ),
                        onChanged: (query) {
                          setState(() {
                            citySuggestions = cities
                                .where((city) =>
                                city.toLowerCase().contains(query.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                      if (citySuggestions.isNotEmpty)
                        Container(
                          height: 150, // Fix dropdown size issue
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListView(
                            children: citySuggestions.map((city) {
                              return ListTile(
                                title: Text(city),
                                onTap: () {
                                  setState(() {
                                    cityController.text = city;
                                    citySuggestions = [];
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("State"),
                      SizedBox(height: 8),
                      TextField(
                        controller: stateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter State",
                        ),
                        onChanged: (query) {
                          setState(() {
                            stateSuggestions = states
                                .where((state) =>
                                state.toLowerCase().contains(query.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                      if (stateSuggestions.isNotEmpty)
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListView(
                            children: stateSuggestions.map((state) {
                              return ListTile(
                                title: Text(state),
                                onTap: () {
                                  setState(() {
                                    stateController.text = state;
                                    stateSuggestions = [];
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Zip Code
            Text("Zip Code"),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Zip Code",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Live Location
            Text("Location"),
            SizedBox(height: 8),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Get the Live Location",
                suffixIcon: IconButton(
                  icon: Icon(Icons.gps_fixed, color: Colors.green),
                  onPressed: _getLiveLocation,
                ),
              ),
            ),
            SizedBox(height: 30),

            // PLACE ORDER Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Green button
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmOrderPage()), // Navigate to Confirm Order Page
                  );
                },
                child: Text(
                  "Place Order",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
