import 'package:flutter/material.dart';
import 'package:flutter_curta/movies.dart';

import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(title: 'AppMoviess', home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAPP createState() => MainAPP();
}

class MainAPP extends State<MainApp> {
  List<Movies> movies = List.empty();
  int total = 0;
  Future<void> readJson({required BuildContext context}) async {
    final String response = await DefaultAssetBundle.of(context).loadString('assets/movies.json');
    Iterable data = await json.decode(response);
    movies = List<Movies>.from(data.map((model) => Movies.fromJson(model)));
    total = movies.length;
    setState(() {
      movies;
      total;
    });
  }

  @override
  initState() {
    super.initState();
    //readJson(context: null);
  }

  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
    future: readJson(context: context),
    builder: (BuildContext context, AsyncSnapshot<void> jsonData){
    return MaterialApp(
        title: 'Movies',
        home: Scaffold(
            body: Center(
          child: ListView.builder(
            itemCount: total,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                         side: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(25)),
                      color: const Color.fromARGB(255, 255, 211, 99),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: [
                          Text(
                            movies[index].title,
                            style: TextStyle(color: Colors.black, fontSize: 25 ),
                            textAlign: TextAlign.justify,
                            
                            
                          ),
                          Text(
                            movies[index].director,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            movies[index].idImdb,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            movies[index].year.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            movies[index].rating.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            textAlign: TextAlign.justify,
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )));
       });
}}