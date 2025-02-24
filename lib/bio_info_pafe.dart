import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BioInfoPage extends StatelessWidget {
  final String videoUrl = "https://www.youtube.com/watch?v=9m5jXRpyklU";

  const BioInfoPage({super.key}); // YouTube video link

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl); // Extract video ID for YouTube player

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        centerTitle: true, // Center the title
        title: Row(
          mainAxisSize: MainAxisSize.min, // Center within available space
          children: [
            Icon(Icons.biotech, color: Colors.white),
            SizedBox(width: 8),
            Text("Bio-Waste"),
          ],
        ),
        backgroundColor: Colors.green,
        actions: [
          Icon(Icons.account_circle),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quote Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "“Bio-waste should be seen as a gift from nature, not something to discard. Composting it closes the loop of sustainability.” – David Suzuki",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 20),
              // Subtitle Section
              Text(
                "How Improper Bio-Waste Disposal Harms Our Planet?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Bullet Points
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Releases methane-greenhouse gas"),
                  Text("• Contributes to air pollution and odors."),
                  Text("• Spreads diseases and attracts pests."),
                  Text("• Contributes to global warming."),
                ],
              ),
              SizedBox(height: 20),
              // Image and Subtitle
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Take a look at how the bio-waste collected from households is recycled.",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/bio.jpeg',
                    width: 100, // Larger size for the image
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 20),
              // YouTube Video Section
              videoId != null
                  ? YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
              )
                  : Center(child: Text("Error loading video")),
            ],
          ),
        ),
      ),
    );
  }
}
