import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/channel_model.dart';

class MoreInfoPage extends StatelessWidget {
  ChannelModel channel;

  MoreInfoPage({required this.channel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Descripcion",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            channel.snippet.description,
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Mas Información",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 12,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "https://www.youtube.com/${channel.snippet.customUrl}",
                  style: TextStyle(
                    color: Color(0xff2876D1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Icon(
                  Icons.public,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  channel.snippet.country,style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Se unio el ${channel.snippet.publishedAt.toLocal()}",
                  style: TextStyle(
                    color: Colors.white70,
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
