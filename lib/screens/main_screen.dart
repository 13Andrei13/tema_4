import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tema_4/screens/movie_screen.dart';
import '../models/movie.dart';
import 'package:http/http.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore_for_file: file_names

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = '/main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Movie> _movies = <Movie>[];
  bool _isLoading = true;
  final logoPicture = 'assets/image/logo-YTS.svg';

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  Future<void> _getMovies() async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'yts.mx',
      pathSegments: <String>['api', 'v2', 'list_movies.json'],
    );

    final Response response = await get(url);
    final Map<String, dynamic> body =
        jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
    final List<dynamic> movies = data['movies'] as List<dynamic>;

    setState(() {
      for (int i = 0; i < movies.length; i++) {
        final Map<String, dynamic> movie = movies[i] as Map<String, dynamic>;
        _movies.add(Movie.fromJson(movie));
      }
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey[700],
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .54,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              itemCount: _movies.length,
              itemBuilder: (BuildContext context, int index) {
                final Movie movie = _movies[index];

                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        MovieScreen.routeName,
                        arguments: movie,
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 8,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.network(movie.mediumCoverImage),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 25,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              movie.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 25,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              movie.year.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            ),
    );
  }
}
