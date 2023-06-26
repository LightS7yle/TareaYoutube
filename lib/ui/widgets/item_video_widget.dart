import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/pages/video_detail_page.dart';

class ItemVideoWidget extends StatelessWidget {
  VideoModel videoModel;
  List<VideoModel> videos=[];
  ItemVideoWidget({
    required this.videoModel,
    required this.videos
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
           int videoIndex=0;
          for( int i=0; i< videos.length ; i++){
              if( videos[i].id.videoId == videoModel.id.videoId){
                  videoIndex = i;
                  break;
              }
          }
           List<VideoModel> newVideos = [ ...videos];
          newVideos.removeAt(videoIndex);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoDetailPage(video:videoModel,videos:newVideos),),);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
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
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Colors.black.withOpacity(0.7),
                    child: Text(
                      "23:22",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.white12,
                backgroundImage: NetworkImage(
                  videoModel.channel.snippet.thumbnails.medium.url,
                ),
              ),
              title: Text(
                videoModel.snippet.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              subtitle: Text(
                "${videoModel.snippet.channelTitle}· 6.5M de vistas · hace 2 años",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white54, fontSize: 13.0),
              ),
              trailing: Column(
                children: [
                  Container(
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(top: 4),
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
