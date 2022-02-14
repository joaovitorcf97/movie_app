import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/services/dio_service_imp.dart';
import 'package:movie_app/widgets/custom_list_card_widget.dart';

import '../utils/apis_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Movies', style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 24),
                ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return movies != null
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: movies.listMovies.length,
                            itemBuilder: (_, index) {
                              return CustomListCardWidget(
                                movie: movies.listMovies[index],
                              );
                            },
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 16),
                          )
                        : Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
