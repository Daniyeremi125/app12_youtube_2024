import 'package:app12_youtube_2024/models/video_model.dart';
import 'package:flutter/material.dart';

class ItemVideoWidget extends StatelessWidget {
  VideoModel videoModel;

  ItemVideoWidget({
    required this.videoModel,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        top: 6.0,
        bottom: 10.0,
      ),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 1.0,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  color: Colors.black.withOpacity(0.7),
                  child: Text(
                    "23:22",
                    style: TextStyle(
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
              backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/1212984/pexels-photo-1212984.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              ),
              backgroundColor: Colors.white38,
            ),
            title: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              "Commodo sunt nisi .",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            subtitle: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "MenLeeMasNa - 8.8 M de vistas - hace 5 años",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 13.0,
              ),
            ),
            trailing: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}