import 'package:flutter_codigo_youapp/models/channel_model.dart';

import 'package:flutter/material.dart';

class PagePrincipal extends StatelessWidget {
  ChannelModel channel;
  PagePrincipal({required this.channel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Image(
          fit: BoxFit.cover,
          image: NetworkImage(
              channel.brandingSettings.image.bannerExternalUrl),
          height: height * 0.2,
          width: double.infinity,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                  channel.snippet.thumbnails.thumbnailsDefault.url),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              channel.snippet.title,
              style: TextStyle(color: Colors.white),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SUSCRITO",
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.notifications_none,
              color: Colors.white70,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "${double.parse(channel.statistics.subscriberCount)/1000 > 999 ? '${(double.parse(channel.statistics.subscriberCount)/1000000) } M':'${(double.parse(channel.statistics.subscriberCount)/1000).ceil() } K'} de subscripciones - ${channel.statistics.videoCount} ",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    channel.snippet.description,
                    style: TextStyle(color: Colors.white70),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
