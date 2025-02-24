import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlasticsInfoPage extends StatelessWidget {
  final String videoUrl = "https://www.youtube.com/watch?v=I_fUpP-hq3A";

  const PlasticsInfoPage({super.key}); // YouTube video link

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
            Icon(Icons.recycling, color: Colors.white),
            SizedBox(width: 8),
            Text("Plastics"),
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
                  "“Plastic pollution is a global issue: killing wildlife, contaminating our oceans and waters, and lasting far longer than it is used.” – Leonardo DiCaprio",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 20),
              // Subtitle Section
              Text(
                "How Improper Plastic Disposal Harms Our Planet?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Bullet Points
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Contaminates soil and water."),
                  Text("• Harms marine and wildlife."),
                  Text("• Releases toxic gases when burned."),
                  Text("• Disrupts ecosystems and habitats."),
                ],
              ),
              SizedBox(height: 20),
              // Image and Subtitle
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Take a look at how the plastic waste collected from households is recycled.",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/plastics.jpeg',
                    width: 100, // Larger size for the image
                    height: 100,
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
