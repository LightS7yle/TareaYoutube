import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/video_model.dart';
import 'package:flutter_codigo_youapp/services/api_service.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';
import 'package:flutter_codigo_youapp/ui/widgets/item_filter_widget.dart';
import 'package:flutter_codigo_youapp/ui/widgets/item_video_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final APIservice _apiService = APIservice();
  List<VideoModel> videos = [];

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async{
  
    videos = await _apiService.getVideos();

    
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 0,
        ),
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: kBrandSecondayColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                  icon: Icon(Icons.explore_outlined),
                  label: Text("Explorar"),
                ),
                SizedBox(
                  height: 32,
                  child: VerticalDivider(
                    thickness: 1,
                    color: Colors.white30,
                  ),
                ),
                ItemFilterWidget(
                  isSelected: true,
                  text: "Todos",
                ),
                ItemFilterWidget(
                  isSelected: false,
                  text: "Mixes",
                ),
                ItemFilterWidget(
                  isSelected: false,
                  text: "Música",
                ),
                ItemFilterWidget(
                  isSelected: false,
                  text: "Programación",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: videos.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemVideoWidget(videoModel: videos[index],videos: videos);
            },
          ),
        ]),
      ),
    );
  }
}
