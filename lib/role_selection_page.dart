import 'package:flutter/material.dart';
import 'waste_selection_page.dart';
import 'bulk_waste_details_page.dart';
import 'plastics_info_page.dart';
import 'paper_info_page.dart';
import 'ewaste_info_page.dart';
import 'metals_info_page.dart';
import 'organic_info_page.dart';
import 'bio_info_pafe.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get screen size

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your Role"),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select how you'll participate in making our environment cleaner",
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.center, // Align text in the center
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WasteSelectionPage()),
                    );
                  },
                  child: RoleCard(icon: Icons.person, text: "Individual Consumer"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BulkWasteDetailsPage()),
                    );
                  },
                  child: RoleCard(icon: Icons.apartment, text: "Bulk Waste Generator"),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Select Waste Categories for recycle informations",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Align text in the center
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > 600 ? 3 : 2, // Adjust columns dynamically
                  childAspectRatio: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final categories = [
                    {"icon": Icons.recycling, "text": "Plastics"},
                    {"icon": Icons.description, "text": "Paper"},
                    {"icon": Icons.memory, "text": "E-Waste"},
                    {"icon": Icons.build, "text": "Metals"},
                    {"icon": Icons.eco, "text": "Organic Waste"},
                    {"icon": Icons.biotech, "text": "Bio-Waste"},
                  ];
                  return GestureDetector(
                    onTap: () {
                      if (categories[index]['text'] == "Plastics") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlasticsInfoPage()),
                        );
                      }else if (categories[index]['text'] == "Paper") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaperInfoPage()),
                        );
                      }else if (categories[index]['text'] == "E-Waste") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EwasteInfoPage()),
                        );
                      }else if (categories[index]['text'] == "Metals") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MetalsInfoPage()),
                        );
                      }else if (categories[index]['text'] == "Organic Waste") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrganicInfoPage()),
                        );
                      }else if (categories[index]['text'] == "Bio-Waste") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BioInfoPage()),
                        );
                      } else {
                        // Handle other categories or add logic for their respective pages
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${categories[index]['text']} page is not yet implemented')),
                        );
                      }
                    },
                    child: CategoryCard(
                      icon: categories[index]['icon'] as IconData,
                      text: categories[index]['text'] as String,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const RoleCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 4, spreadRadius: 1),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: Colors.green),
          SizedBox(height: 8),
          Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const CategoryCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 3, spreadRadius: 1),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.green),
          SizedBox(width: 8),
          Text(text, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
