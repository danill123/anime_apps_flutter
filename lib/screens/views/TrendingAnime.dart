import 'package:anime_apps_flutter/screens/views/helpers.dart';
import 'package:flutter/material.dart';

class TrendingAnime extends StatefulWidget {
  @override
  _TrendingAnimeState createState() => _TrendingAnimeState();
}

class _TrendingAnimeState extends State<TrendingAnime> {
  Future data;
  @override
  void initState() {
    super.initState();
    data = Network("https://kitsu.io/api/edge/trending/anime").fetchData();
    print(data);
  }

  // print(await http.read('https://kitsu.io/api/edge/trending/anime'));

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future getData() async {
    var data;
    String url = "https://kitsu.io/api/edge/trending/anime";
    Network network = Network(url);
    data = network.fetchData();
    return data;
  }
}
