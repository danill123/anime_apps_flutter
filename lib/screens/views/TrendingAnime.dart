import 'dart:html';

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
    */
    data = getData();
    print(data);
  }

  // print(await http.read('https://kitsu.io/api/edge/trending/anime'));

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
                return CircularProgressIndicator();
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
  /*
  return Container(
    child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text("${data[index]["attributes"]["canonicalTitle"]}"),
              subtitle: Text("${data[index]["attributes"]["slug"]}"),
            )
          ],
        );
      },
    ),
  );
  */
  return Container(
    child: Swiper(
      itemCount: data.length,
      itemBuilder: (context, int index) {
        return Image.network(data[index]["attributes"]["posterImage"]["small"],
            fit: BoxFit.fitHeight);
      },
      itemWidth: 400.0,
      itemHeight: 500.0,
      viewportFraction: 0.8,
      scale: 0.9,
    ),
  );
}
