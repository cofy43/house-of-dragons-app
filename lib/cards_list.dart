import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'card_template.dart';

class CardClass {
  final String name;
  final String title;
  final String family;
  final String imageUrl;

  const CardClass({
    required this.name,
    required this.title,
    required this.family,
    required this.imageUrl,
  });

  factory CardClass.fromJson(Map<String, dynamic> json) {
    return CardClass(
        name: json['fullName'],
        title: json['title'],
        family: json['family'],
        imageUrl: json['imageUrl'],
    );
  }
}

Future<List<CardClass>> fetchAlbum() async {
  final response = await http
      .get(
        Uri.parse('https://game-of-thrones1.p.rapidapi.com/Characters'),
        headers: {
          'X-RapidAPI-Key': '2e0a8745a1msh48e0256a1198c5bp19d6e8jsnc3cfadcda776',
          'X-RapidAPI-Host': 'game-of-thrones1.p.rapidapi.com'
        }
      );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<CardClass> list = [];

    for (var item in jsonDecode(response.body)) {
      var obj =CardClass.fromJson(item);
      list.add(obj);
    }
    //return new CardClass(name: '', title: '', family: '', imageUrl: '');
    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class CardList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardList();
  }
}

class _CardList extends State<CardList> {
  late Future<List<CardClass>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<CardClass>>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ScrollSnapList(
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    child: CardTemplate(
                        snapshot.data![index].name,
                        snapshot.data![index].title,
                        snapshot.data![index].family,
                        snapshot.data![index].imageUrl
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
                itemSize: 300,
                onItemFocus: (index) {},
                dynamicItemSize: true,
                scrollDirection: Axis.horizontal,
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }
      ),
    );
  }

}