import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';

import '../utils/apis_utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;

  const CustomListCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                API.REQUEST_IMG(movie.posterPath),
                loadingBuilder: (_, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline6,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const Spacer(),
                    Text(
                      'Popularidade: ${movie.popularity.toString()}',
                      softWrap: true,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Votos: ${movie.voteAverage.toString()}',
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
