import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://www.themoviedb.org/t/p/w500/';

  const MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath!;
    } else {
      path =
          'https://content.presentermedia.com/files/clipart/00001000/1638/film_clap_board_800_wht.jpg';
    }

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                child: Text(movie.overview!),
                padding: EdgeInsets.symmetric(horizontal: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
