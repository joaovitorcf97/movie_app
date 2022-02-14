import '../models/movies_model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}
