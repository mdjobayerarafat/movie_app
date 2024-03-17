import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details_screen.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<dynamic> _movies = [];

  Future<void> _fetchMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=e031342b6731a2418e190ada1169204f'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _movies = jsonData['results'];
      });
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
         backgroundColor:  Color.fromRGBO(114, 9, 183, 70),
      ),
      body: _movies.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                final movie = _movies[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                    width: 50.0,
                    height: 75.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie['title'],
                  style: const TextStyle(color: Color.fromRGBO(241, 250, 238, 1),
                  ),
                  ),
                  subtitle: Text(movie['release_date'],
                  style: const TextStyle(color: Color.fromRGBO(168, 218, 220, 1),
                  ),),
                  onTap: () {
                    Navigator.push(
                        context,
                MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(movie: movie)));
                  },
                );
              },
            ),
    );
  }
}