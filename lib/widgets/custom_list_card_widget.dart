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
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.black54),
      child: Row(
        children: [
          Image.network(
            API.REQUEST_IMG(movie.posterPath),
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
    );
  }
}
