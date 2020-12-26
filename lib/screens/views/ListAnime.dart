import 'package:flutter/material.dart';
import 'package:anime_apps_flutter/screens/views/helpers.dart';

class ListAnime extends StatefulWidget {
  @override
  _ListAnimeState createState() => _ListAnimeState();
}

class _ListAnimeState extends State<ListAnime> {
  Future data;
  String next_api = '';
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    data = getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('tested dude'); // works dude
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: FutureBuilder(
          future: data,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              next_api = snapshot.data["links"]["next"];
              return ListAnime(snapshot.data["data"], context);
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
            }
          },
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              data = getData();
            });
          },
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Colors.green,
        ));
  }

  Future getData() async {
    var data;
    String url;

    if (next_api.isEmpty) {
      url = "https://kitsu.io/api/edge/anime";
    } else {
      url = next_api;
    }

    Network network = Network(url);
    data = network.fetchData();
    return data;
  }
  /*
  floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            incr++;
            print(incr);
          },
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Colors.green,
  )
  */

  Widget ListAnime(List data, BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return Card(
            child: ListTile(
              leading: Image.network(
                  data[index]["attributes"]["posterImage"]["medium"]),
              title: Text(data[index]["attributes"]["titles"]["en_jp"]),
              subtitle: Text(data[index]["attributes"]["canonicalTitle"]),
              isThreeLine: true,
            ),
          );
        });
  }
}
