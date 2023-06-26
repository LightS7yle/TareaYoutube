import 'package:flutter/material.dart';
import 'package:flutter_codigo_youapp/models/channel_model.dart';
import 'package:flutter_codigo_youapp/pages/page_principal.dart';
import 'package:flutter_codigo_youapp/ui/general/colors.dart';

import 'more_info_page.dart';

class ChannelPage extends StatefulWidget {
  ChannelModel channel;

  ChannelPage({required this.channel});
  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBrandPrimaryColor,
        title: Text(widget.channel.snippet.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.cast),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 2.7,
          tabs: [
            Tab(
              child: Text(
                "PAGINA PRINCIPAL",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Tab(
              child: Text(
                "MAS INFORMACION",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Tab(
              child: Text(
                "LISTA DE REPRODUCCION",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Tab(
              child: Text(
                "COMUNIDAD",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Tab(
              child: Text(
                "CANALES",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Tab(
              child: Text(
                "VIDEOS",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PagePrincipal(channel: widget.channel),
          MoreInfoPage(channel: widget.channel),

          Center(child: Text("Pagina 2"),),
          Center(child: Text("Pagina 3"),),
          Center(child: Text("Pagina 4"),),
          Center(child: Text("Pagina 5"),),
        ],
      ),
    );
  }
}
