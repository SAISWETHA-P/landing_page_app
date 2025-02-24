import 'package:flutter/material.dart';
import 'next_page.dart';
class BulkWasteDetailsPage extends StatelessWidget {
  const BulkWasteDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get screen size for responsiveness
    return Scaffold(
      appBar: AppBar(
        title: Text("Bulk Waste Details"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Industry Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Organization Name Field
              _buildTextField("Organization Name"),
              SizedBox(height: 16),
              // Industry Type Field
              _buildTextField("Industry Type"),
              SizedBox(height: 16),
              // Contact Person Field
              _buildTextField("Contact Person"),
              SizedBox(height: 16),
              // Contact Number Field
              _buildTextField("Contact Number"),
              SizedBox(height: 20),
              Text(
                "What types of waste would you like to recycle?",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // Waste Type Field
              _buildTextField("Enter the type of Waste"),
              SizedBox(height: 30),
              // Book the Schedule Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.3, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Handle button action
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NextPage()),
                    );
                  },
                  child: Text(
                    "Book the Schedule",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
