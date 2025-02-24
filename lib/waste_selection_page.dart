import 'package:flutter/material.dart';
import 'next_page.dart'; // Import the next page (create this if not done yet)

class WasteSelectionPage extends StatefulWidget {
  const WasteSelectionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WasteSelectionPageState createState() => _WasteSelectionPageState();
}

class _WasteSelectionPageState extends State<WasteSelectionPage> {
  // Stores checkbox states
  Map<String, bool> selectedWasteTypes = {
    "Plastics": false,
    "Paper": false,
    "Metals": false,
    "E-Waste": false,
    "Bio-Waste": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select waste types"),
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
              "Select waste types and enter weights",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: selectedWasteTypes.keys.map((wasteType) {
                  return WasteTypeCard(
                    title: wasteType,
                    requirement: _getRequirementText(wasteType),
                    icon: _getWasteIcon(wasteType),
                    isChecked: selectedWasteTypes[wasteType]!,
                    onChanged: (bool? newValue) {
                      setState(() {
                        selectedWasteTypes[wasteType] = newValue!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  backgroundColor: Colors.green,
                ),
                child: Text("Proceed"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Get requirement text based on waste type
  String _getRequirementText(String wasteType) {
    switch (wasteType) {
      case "Plastics":
        return "Min. requirement: 5 kg";
      case "Paper":
        return "Min. requirement: 5 kg";
      case "Metals":
        return "Min. requirement: 1 kg";
      case "E-Waste":
        return "No minimum requirement";
      case "Bio-Waste":
        return "Min. requirement: 3 kg";
      default:
        return "";
    }
  }

  // Get icon based on waste type
  IconData _getWasteIcon(String wasteType) {
    switch (wasteType) {
      case "Plastics":
        return Icons.recycling;
      case "Paper":
        return Icons.description;
      case "Metals":
        return Icons.build;
      case "E-Waste":
        return Icons.memory;
      case "Bio-Waste":
        return Icons.biotech;
      default:
        return Icons.help;
    }
  }
}

// Waste Type Card Widget
class WasteTypeCard extends StatelessWidget {
  final String title;
  final String requirement;
  final IconData icon;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const WasteTypeCard({super.key, 
    required this.title,
    required this.requirement,
    required this.icon,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.green, size: 24),
                    SizedBox(width: 8),
                    Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 4),
                Text(requirement, style: TextStyle(color: Colors.grey[700])),
                SizedBox(height: 8),
                SizedBox(
                  width: 120,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Weight(Kg)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}