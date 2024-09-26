import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiKey = 'TU_API_KEY'; 
  final String channelId = 'AIzaSyDFM46dXSLM5yxkM2CkRhygUbfvhHehuMY';
  List videos = [];

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  // Método para obtener videos de la API de YouTube
  Future<void> fetchVideos() async {
    final url = 'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=$channelId&maxResults=10&key=$apiKey';
    
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          videos = data['items'];
        });
      } else {
        throw Exception('Error al cargar los videos');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('YouTube', style: TextStyle(color: Colors.white)),
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {}),
                IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
                IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
      body: videos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                final videoTitle = video['snippet']['title'];
                final videoThumbnail = video['snippet']['thumbnails']['medium']['url'];
                final videoChannel = video['snippet']['channelTitle'];
                final videoPublishedAt = video['snippet']['publishedAt'];

                return VideoCard(
                  thumbnailUrl: videoThumbnail,
                  title: videoTitle,
                  channel: videoChannel,
                  date: videoPublishedAt,
                  duration: '', // Puedes integrar la duración si usas `videos.list`
                );
              },
            ),
      backgroundColor: Colors.black,
    );
  }
}

class VideoCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String channel;
  final String date;
  final String duration;

  const VideoCard({
    required this.thumbnailUrl,
    required this.title,
    required this.channel,
    required this.date,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(thumbnailUrl),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.all(4),
                  child: Text(
                    duration.isNotEmpty ? duration : 'N/A',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '$channel · $date',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
