import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details_screen.dart';

class WebSeriesScreen extends StatefulWidget {
  @override
  _WebSeriesScreenState createState() => _WebSeriesScreenState();
}

class _WebSeriesScreenState extends State<WebSeriesScreen> {
  List<dynamic> _webSeries = [];

  Future<void> _fetchWebSeries() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=e031342b6731a2418e190ada1169204f'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _webSeries = jsonData['results'];
      });
    } else {
      throw Exception('Failed to load web series');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWebSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Series'),
         backgroundColor:  Color.fromRGBO(230, 57, 70, 50),
        
      ),
      body: _webSeries.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _webSeries.length,
              itemBuilder: (context, index) {
                final webSeries = _webSeries[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${webSeries['poster_path']}',
                    width: 50.0,
                    height: 75.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(webSeries['name'],
                  style: const TextStyle(color: Color.fromRGBO(241, 250, 238, 1),
                  ),),
                  subtitle: Text(webSeries['first_air_date'],
                  style: const TextStyle(color: Color.fromRGBO(168, 218, 220, 1),
                  ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(movie: webSeries)));
                  },
                );
              },
            ),
    );
  }
}