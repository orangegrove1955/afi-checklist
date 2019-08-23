import 'dart:math';

import 'package:afi_checklist/movie_lists/movie_type.dart';
import 'package:flutter/material.dart';
import './movie_lists/laughs.dart' as laughs;
import './movie_lists/movies.dart' as movies;
import './movie_lists/thrills.dart' as thrills;
import './movie_lists/passions.dart' as passions;
import './movie_lists/heroes.dart' as heroes;
import './movie_lists/songs.dart' as songs;
import './MovieList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: '100 Years 100 ...'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: movieTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: movieTabs.map((MovieTab tab) {
              return Tab(text: tab.title);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: movieTabs.map((MovieTab tab) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: tabBody(tab.movies),
            );
          }).toList(),
        ),
      ),
    );
  }
}

Widget tabBody(List movieList) {
  // Calculate progress
  double progress =
      (movieList.fold(0, (total, movie) => total + (movie.watched ? 1 : 0))) / movieList.length;

  return Stack(
    children: <Widget>[
      MovieList(movieList),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: LinearProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
              backgroundColor: Colors.grey[300],
              value: progress),
        ),
      ),
    ],
  );
}

class MovieTab {
  const MovieTab({this.title, this.movies});
  final String title;
  final List movies;
}

const List<MovieTab> movieTabs = [
  const MovieTab(title: 'All', movies: movies.list),
  const MovieTab(title: 'Movies', movies: movies.list),
  const MovieTab(title: 'Laughs', movies: laughs.list),
  const MovieTab(title: 'Thrills', movies: thrills.list),
  const MovieTab(title: 'Passions', movies: passions.list),
  const MovieTab(title: 'Heroes & Villains', movies: heroes.list),
  const MovieTab(title: 'Songs', movies: songs.list),
];
