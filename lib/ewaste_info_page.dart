import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EwasteInfoPage extends StatelessWidget {
  final String videoUrl = "https://www.youtube.com/watch?v=U3KUJTDPsSE";

  const EwasteInfoPage({super.key}); // YouTube video link

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
            Icon(Icons.memory, color: Colors.white),
            SizedBox(width: 8),
            Text("E-Waste"),
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
                  "“E-waste is a looming problem, and we must do everything in our power to stop it from growing. The planet is not a dump.” – Annie Leonard",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 20),
              // Subtitle Section
              Text(
                "How Improper E-waste Disposal Harms Our Planet?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Bullet Points
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Contaminates soil and water."),
                  Text("• Releases harmful gases when burned."),
                  Text("• Wastes valuable metals."),
                  Text("• Poses health risks to humans."),
                ],
              ),
              SizedBox(height: 20),
              // Image and Subtitle
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Take a look at how the E-Waste waste collected from households is recycled.",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/ewaste.jpeg',
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
