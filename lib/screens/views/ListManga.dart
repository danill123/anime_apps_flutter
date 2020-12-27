import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ListManga extends StatefulWidget {
  @override
  _ListMangaState createState() => _ListMangaState();
}

class _ListMangaState extends State<ListManga> {
  ScrollController _scrollController = new ScrollController();
  List manga_list = new List();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "100+ list manga reference",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: List_Manga(manga_list, context),
    );
  }

  void _getMoreData() async {
    String url =
        "https://kitsu.io/api/edge/manga?page[limit]=10&page[offset]=${incr_api.toString()}"; // api for manga
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        incr_api += 10;
        manga_list.addAll(data["data"]);
      });
    }
  }

  Widget List_Manga(List data, BuildContext context) {
    if (data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          controller: _scrollController,
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Card(
              elevation: 2.0,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(16.0),
              ),
              child: new InkWell(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Center(
                        child: ClipRRect(
                      child: new Image.network(
                        data[index]["attributes"]["posterImage"]["original"] ??
                            'https://via.placeholder.com/400x200',
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: new Radius.circular(16.0),
                        topRight: new Radius.circular(16.0),
                      ),
                    )),
                    new Padding(
                      padding: new EdgeInsets.all(16.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            data[index]["attributes"]["titles"]["en_jp"] ?? ' ',
                            style: TextStyle(fontSize: 20),
                          ),
                          new SizedBox(height: 5.0),
                          Text(
                              "Rating : ${data[index]["attributes"]["averageRating"] ?? ' '}"),
                          Text(
                              "Popularity Rank : ${data[index]["attributes"]["popularityRank"] ?? ' '}")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }
  }
}
