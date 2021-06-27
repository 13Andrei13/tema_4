import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/movie.dart';
import 'package:http/http.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);
  static const routeName = '/movie_screen';

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool selectedSection = true;
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;
    String movieGenres = '';

    for (int i = 0; i < movie.genres.length; i = i + 1) {
      if (i == 0)
        movieGenres = movie.genres[i].toString();
      else
        movieGenres = movieGenres + ' / ' + movie.genres[i].toString();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey[700],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 25,
                top: 40,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
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
                    fontSize: 19,
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
                  movieGenres,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 8,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(movie.mediumCoverImage),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.blue,
                          size: 40,
                        ),
                        Icon(
                          FontAwesomeIcons.reddit,
                          color: Colors.orange,
                          size: 40,
                        ),
                        Icon(
                          FontAwesomeIcons.pinterest,
                          color: Colors.red,
                          size: 40,
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.green,
                              size: 40,
                            ),
                            Text(
                              movie.runtime.toString(),
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.imdb,
                              color: Colors.yellow,
                              size: 40,
                            ),
                            Text(
                              movie.rating.toString(),
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(29),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Synopsis',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  movie.synopsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            GestureDetector(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSection = !selectedSection;
                          });
                        },
                        child: Text(
                          '720p.BLU',
                          style: TextStyle(
                              color:
                                  selectedSection ? Colors.black : Colors.white,
                              fontSize: 30),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSection = !selectedSection;
                          });
                        },
                        child: Text(
                          '1080p.BLU',
                          style: TextStyle(
                              color: !selectedSection
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
