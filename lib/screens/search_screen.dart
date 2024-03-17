import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final String _searchQuery = '';
  List<dynamic> _searchResults = [];

  Future<void> _search() async {
    if (_searchQuery.isNotEmpty) {
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/search/multi?api_key=e031342b6731a2418e190ada1169204f&query=${_searchQuery}'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          _searchResults = jsonData['results'];
        });
      } else {
        throw Exception('Failed to search');
      }
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
         backgroundColor:  const Color.fromRGBO(67, 97, 238, 70),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _search,
          ),
        ],
      ),
      body: _searchResults.isEmpty
          ? const Center(
              child: Text('Search for movies and web series'),
            )
          : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final result = _searchResults[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${result['poster_path']}',
                    width: 50.0,
                    height: 75.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(result['title'] ?? result['name']),
                  subtitle: Text(result['release_date'] ?? result['first_air_date']),
                  onTap: () {
                    if (result['media_type'] == 'movie') {
                      Navigator.push(
                          context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(movie: result)));
                    } else {
                      Navigator.push(
                          context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(movie: result)));
                    }
                  },
                );
              },
            ),
    );
  }
}