import 'package:dio/dio.dart';
import 'package:movie_app/services/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMWRjZDM2NzJhODNjZTA2NTgyNzU4M2QxYTk0ODcwMyIsInN1YiI6IjYyMGE3MzE4ZjQ4YjM0MDA0MDZhNTMxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zXPK2Hx6FGJBUUEnyViXRERIncpf9M3gzBhG8PkYQoA',
        },
      ),
    );
  }
}
