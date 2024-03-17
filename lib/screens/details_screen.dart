import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']),
        backgroundColor:  const Color.fromRGBO(67, 97, 238, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}',
              width: double.infinity,
              height: 250.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movie['title'],
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                       color: Color.fromRGBO(168, 218, 220, 1),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movie['release_date'],
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(241, 250, 238, 1),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    movie['overview'],
                    
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.5,
                       color: Color.fromRGBO(241, 250, 238, 1),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}