import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrendingDetailPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final data_list;
  const TrendingDetailPage({Key key, this.data_list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: new EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  new SizedBox(height: 20.0),
                  ClipRRect(
                    child: Image.network(
                      data_list["attributes"]["coverImage"]["original"] ??
                          'https://via.placeholder.com/400x200',
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  Text(
                    data_list["attributes"]["titles"]["en_jp"] ?? " ",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  new SizedBox(height: 30.0),
                  Text("Synopsis : \n ${data_list["attributes"]["synopsis"]}"),
                  new SizedBox(height: 10.0),
                  Container(
                    margin: EdgeInsets.only(top: 3, bottom: 3),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "popularity rank : ${data_list["attributes"]["popularityRank"].toString() ?? " "} "),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3, bottom: 3),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "rating rank : ${data_list["attributes"]["ratingRank"].toString() ?? " "} "),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3, bottom: 3),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "age rating : ${data_list["attributes"]["ageRating"].toString() ?? " "} "),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3, bottom: 3),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "age rating guide : ${data_list["attributes"]["ageRatingGuide"].toString() ?? " "} "),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "sub type : ${data_list["attributes"]["subtype"].toString() ?? " "} "),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "start date : ${data_list["attributes"]["startDate"].toString() ?? " "} "),
                      )),
                  new SizedBox(height: 20.0),
                ],
              ),
            ),
          )),
      backgroundColor: Colors.white,
    );
  }
}
