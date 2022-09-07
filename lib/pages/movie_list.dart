import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/http_service.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List? movies;
  late HttpService service;

  final String imgPath = 'https://www.themoviedb.org/t/p/w500/';

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies?.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int pos) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Container(
                  padding: EdgeInsets.all(8),
                  child: Image.network(
                    imgPath + movies![pos].posterPath,
                  )),
              title: Text(movies![pos].title),
              subtitle: Text(
                'Rating = ${movies![pos].voteAverage.toString()}',
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movie: movies![pos]));
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
