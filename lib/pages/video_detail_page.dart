import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/pages/channel_page.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';
import 'package:flutter_codigo_youapp/ui/widgets/item_video_detail_widget.dart';
import 'package:flutter_codigo_youapp/ui/widgets/item_video_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailPage extends StatefulWidget {
  VideoModel video;
  List<VideoModel> videos = [];
  VideoDetailPage({required this.video, required this.videos});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playerController = YoutubePlayerController(
        initialVideoId: widget.video.id.videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          hideControls: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: Column(children: [
        SizedBox(
          height: height * 0.35,
          child: YoutubePlayer(
            controller: _playerController,
            progressColors: ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.red,
              bufferedColor: Colors.white54,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
        ListTile(
          title: Text(
            widget.video.snippet.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              height: 1.5,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            "6.5M de vistas · hace 2 años",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white54,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ItemVideoDetailWidget(
                      text: "53 K",
                      icon: Icons.thumb_up_alt_outlined,
                    ),
                    ItemVideoDetailWidget(
                      text: "No me gusta",
                      icon: Icons.thumb_down_alt_outlined,
                    ),
                    ItemVideoDetailWidget(
                      text: "Compartir",
                      icon: Icons.share,
                    ),
                    ItemVideoDetailWidget(
                      text: "Crear",
                      icon: Icons.play_arrow_rounded,
                    ),
                    ItemVideoDetailWidget(
                      text: "Descargar",
                      icon: Icons.download_rounded,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.white24,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChannelPage(channel: widget.video.channel),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: Colors.white24,
                backgroundImage: NetworkImage(
                    widget.video.channel.snippet.thumbnails.medium.url),
              ),
              title: Text(
                widget.video.channel.snippet.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                "1.4M de Suscriptores",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "SUSCRITO",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.notifications_none,
                    color: Colors.white70,
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.white24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Comentarios",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "2.9 K",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.unfold_more,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/343241/pexels-photo-343241.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                    radius: 12,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Excelente video, sigue asi!. Te deseo el mejor de los exitos",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: widget.videos.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemVideoWidget(
                    videoModel: widget.videos[index], videos: widget.videos);
              },
            ),
            Container(
              color: Colors.blue,
              height: 200,
            ),
            Container(
              color: Colors.indigo,
              height: 200,
            ),
          ]),
        ))
      ]),
    );
  }
}
