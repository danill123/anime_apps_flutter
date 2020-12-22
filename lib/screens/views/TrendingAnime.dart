// import 'dart:html'; // -> caused error on compiled

import 'package:anime_apps_flutter/screens/views/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TrendingAnime extends StatefulWidget {
  @override
  _TrendingAnimeState createState() => _TrendingAnimeState();
}

class _TrendingAnimeState extends State<TrendingAnime> {
  Future data;
  @override
  void initState() {
    super.initState();
    /*
    data = Network("https://kitsu.io/api/edge/trending/anime").fetchData();
    data.then((value) {
      print(value);
    });
    // only for debugging Rest API purpose
    */
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "trending anime",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // success will return
                return createCarouselList(snapshot.data, context);
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      new SizedBox(height: 15.0),
                      Text("Make sure your internet connection stable"),
                      new SizedBox(height: 5.0),
                      Text("pastikan koneksi internet stabil")
                    ],
                  ),
                );
                // return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Future getData() async {
    var data;
    String url = "https://kitsu.io/api/edge/trending/anime";
    Network network = Network(url);
    data = network.fetchData();
    return data;
  }
}

Widget createCarouselList(List data, BuildContext context) {
  return Container(
    child: Swiper(
      itemCount: data.length,
      itemBuilder: (context, int index) {
        /*
        return Image.network(data[index]["attributes"]["posterImage"]["small"],
            fit: BoxFit.fitHeight);
        */
        return new Card(
          elevation: 2.0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(16.0),
          ),
          child: new InkWell(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new ClipRRect(
                  child: new Image.network(
                    data[index]["attributes"]["posterImage"]["small"] ??
                        'https://via.placeholder.com/400x200',
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: new Radius.circular(16.0),
                    topRight: new Radius.circular(16.0),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(16.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          data[index]["attributes"]["titles"]["en_jp"] ?? ' '),
                      new SizedBox(height: 5.0),
                      Text(
                          "Rating : ${data[index]["attributes"]["averageRating"] ?? ' '}"),
                      Text(
                          "Age rating : ${data[index]["attributes"]["ageRating"] ?? ' '}") // add text with null safety
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              print("tested dude");
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => new DetailPage(data: this.data)));
            },
          ),
        );
      },
      itemWidth: 400.0,
      itemHeight: 500.0,
      viewportFraction: 0.8,
      scale: 0.9,
    ),
  );
}
