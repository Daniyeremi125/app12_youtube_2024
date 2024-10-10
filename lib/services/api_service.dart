import 'package:app12_youtube_2024/models/video_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<List<VideoModel>> getVideos() async {
    List<VideoModel> videosModel = [];
    String path =
        "https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyDFM46dXSLM5yxkM2CkRhygUbfvhHehuMY&maxResults=20&regionCode=PE";
    Uri uri = Uri.parse(path);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List videos = myMap["items"];

      for (var video in videos) {
        String channelId = video['snippet']['channelId'];
        String avatarUrl = await fetchChannelAvatar(channelId); 


        VideoModel videoModel = VideoModel.fromJson(video, avatarUrl);
        videosModel.add(videoModel);
      }

      print(videosModel);
      print(response.statusCode);
      return videosModel;
    }
    return videosModel;
  }

  Future<VideoModel> fetchVideoDetails(String videoId, String channelId) async {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/youtube/v3/videos?part=snippet,contentDetails,statistics&id=$videoId&key=AIzaSyDFM46dXSLM5yxkM2CkRhygUbfvhHehuMY'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      String avatarUrl = await fetchChannelAvatar(channelId); 

      return VideoModel(
        kind: jsonData['items'][0]['kind'],
        etag: jsonData['items'][0]['etag'],
        id: Id.fromJson(jsonData['items'][0]['id']),
        snippet: Snippet.fromJson(jsonData['items'][0]['snippet']),
        duration: jsonData['items'][0]['contentDetails']['duration'] ?? '00:00',
        viewCount: jsonData['items'][0]['statistics']['viewCount']?.toString() ?? '0',
        channelAvatarUrl: avatarUrl, 
      );
    } else {
      throw Exception('Error al cargar los detalles del video');
    }
  }

  Future<String> fetchChannelAvatar(String channelId) async {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/youtube/v3/channels?part=snippet&id=$channelId&key=AIzaSyDFM46dXSLM5yxkM2CkRhygUbfvhHehuMY'), 
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['items'].isNotEmpty) {
        return jsonData['items'][0]['snippet']['thumbnails']['default']['url'];
      }
    }
    return 'https://example.com/default-avatar.png'; 
  }
}