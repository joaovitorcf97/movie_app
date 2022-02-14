import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';

import '../utils/apis_utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;

  const DetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.height,
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                movie.overview,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.title),
                  Text(
                    movie.originalTitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.date_range),
                  Text(
                    movie.releaseDate,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
