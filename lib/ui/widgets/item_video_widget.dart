
import 'package:app12_youtube_2024/models/video_model.dart';
import 'package:flutter/material.dart';

class ItemVideoWidget extends StatelessWidget {
  final VideoModel videoModel; 
  final VoidCallback onTap; 

  const ItemVideoWidget({super.key, required this.videoModel, required this.onTap}); 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector( 
      onTap: onTap, 
      child: Container(
        margin: const EdgeInsets.only(top: 6.0, bottom: 10.0),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  videoModel.snippet.thumbnails.high.url,
                  width: double.infinity,
                  height: height * 0.3,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    color: Colors.black.withOpacity(0.7),
                    child: Text(
                      videoModel.duration.isNotEmpty ? videoModel.duration : '8:00', 
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(videoModel.channelAvatarUrl),
                backgroundColor: Colors.white38,
              ),
              title: Text(
                videoModel.snippet.title, 
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
              subtitle: Text(
                "${videoModel.snippet.channelTitle} - ${videoModel.viewCount} de vistas", 
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 13.0,
                ),
              ),
              trailing: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}