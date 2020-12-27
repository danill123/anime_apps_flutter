import 'package:anime_apps_flutter/screens/views/TrendingDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ListAnime extends StatefulWidget {
  @override
  _ListAnimeState createState() => _ListAnimeState();
}

class _ListAnimeState extends State<ListAnime> {
  ScrollController _scrollController = new ScrollController();
  List anime_list = new List();
  int incr_api = 0;

  @override
  void initState() {
    super.initState();
    this._getMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        this._getMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "100+ list anime",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListAnime(anime_list, context)
        // body: FutureBuilder(future: null, builder: null),
        );
  }

  void _getMoreData() async {
    String url =
        "https://kitsu.io/api/edge/anime?page[limit]=10&page[offset]=${incr_api.toString()}";
    // "https://kitsu.io/api/edge/manga?page[limit]=10&page[offset]=${incr_api.toString()}"; api for manga
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        incr_api += 10;
        anime_list.addAll(data["data"]);
      });
    }
  }

  Widget ListAnime(List data, BuildContext context) {
    if (data == null) {
      return CircularProgressIndicator();
    } else {
      return ListView.builder(
          controller: _scrollController,
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return InkWell(
              child: Card(
                child: ListTile(
                  leading: Image.network(
                      data[index]["attributes"]["posterImage"]["small"]),
                  title: Text(data[index]["attributes"]["titles"]["en_jp"]),
                  subtitle: Text(data[index]["attributes"]["canonicalTitle"]),
                  isThreeLine: true,
                ),
              ),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TrendingDetailPage(data_list: data[index])))
              },
            );
          });
    }
  }
}
