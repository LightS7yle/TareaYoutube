import 'dart:convert';

import 'package:flutter_codigo_youapp/models/channel_model.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIservice {
  Future<List<VideoModel>> getVideos() async {
    List<VideoModel> videosModel = [];
    String _path =
        "$pathProduction/search?part=snippet&key=$apiKey&maxResults=20&regionCode=PE";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      List videos = myMap["items"];
      videosModel = await completeData(videos);
      return videosModel;
    }
    return videosModel;
  }

  Future <ChannelModel> getChannel(channelId) async {


    String _path =
        "$pathProduction/channels?key=$apiKey&id=$channelId&part=snippet&part=brandingSettings&part=statistics";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);


      Map<String, dynamic> myMap = jsonDecode(response.body);
       ChannelModel channels = ChannelModel.fromJson(myMap["items"][0]);
      return channels;


  }
  Future <List<VideoModel>> completeData(videos) async {
    List<VideoModel> videoFinal=[];
    Iterable<Future<VideoModel>> mapFuture= videos.map<Future<VideoModel>>((e) async {
      ChannelModel channel=await getChannel(e["snippet"]["channelId"]);
      e["channel"] = channel;

      return VideoModel.fromJson(e);
    });
    for(Future<VideoModel> f in mapFuture) {
      f.then((value)=> videoFinal.add(value));
    }
    return videoFinal;
  }
}