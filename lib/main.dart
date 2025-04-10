import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Movies')),
        body: const MovieList(),
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<dynamic> Movies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    final String jsonString = await rootBundle.loadString('assets/movies.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    setState(() {
      Movies = jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Movies.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: Movies.length,
          itemBuilder: (context, index) {
            // ignore: non_constant_identifier_names
            final Movie = Movies[index];
            return Card(
              color: const Color.fromARGB(255, 166, 230, 241),
              margin: const EdgeInsets.all(9),
              child: ListTile(
                title: Text(Movie["title"]),
                subtitle: Text(
                  "Ano: ${Movie["year"]} | Descrição: ${Movie["description"]}  | Diretor: ${Movie["director"]}   | Titulo: ${Movie["title"]}   | Duração: ${Movie["duration"]}  | Avaliação: ${Movie["rating"]}",
                ),
                
              ),
            );
          },
        );
  }
}