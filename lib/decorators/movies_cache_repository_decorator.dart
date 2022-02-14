import 'dart:convert';
import 'dart:developer' as developer;

import 'package:movie_app/decorators/movie_repository_decorator.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/movies_model.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository)
      : super(moviesRepository);
  @override
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(Movies movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    developer.log('saving on cache: $jsonMovies');
  }

  Future<Movies> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = Movies.fromJson(json);
    developer.log('getting on cache: ${movies.toString()}');
    return movies;
  }
}
