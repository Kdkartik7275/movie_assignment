import 'package:movies_assignment/src/movies/domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.score,
    required super.id,
    required super.name,
    required super.type,
    required super.language,
    required super.genres,
    required super.status,
    super.runtime,
    super.averageRuntime,
    super.premiered,
    super.ended,
    super.officialSite,
    super.scheduleTime,
    super.scheduleDays,
    super.rating,
    required super.weight,
    super.networkName,
    super.networkCountry,
    super.imageMedium,
    super.imageOriginal,
    super.summary,
    super.imdbId,
    super.previousEpisodeName,
    super.nextEpisodeName,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final show = json['show'] as Map<String, dynamic>;

    return MovieModel(
      score: json['score'] as double,
      id: show['id'] as int,
      name: show['name'] as String,
      type: show['type'] as String,
      language: show['language'] as String,
      genres: List<String>.from(show['genres'] as List),
      status: show['status'] as String,
      runtime: show['runtime'] as int?,
      averageRuntime: show['averageRuntime'] as int?,
      premiered: show['premiered'] as String?,
      ended: show['ended'] as String?,
      officialSite: show['officialSite'] as String?,
      scheduleTime: show['schedule']?['time'] as String?,
      scheduleDays: List<String>.from(show['schedule']?['days'] ?? []),
      rating: (show['rating']?['average'] as num?)?.toDouble(),
      weight: show['weight'] as int,
      networkName: show['network']?['name'] as String?,
      networkCountry: show['network']?['country']?['name'] as String?,
      imageMedium: show['image']?['medium'] as String?,
      imageOriginal: show['image']?['original'] as String?,
      summary: show['summary'] as String?,
      imdbId: show['externals']?['imdb'] as String?,
      previousEpisodeName:
          show['_links']?['previousepisode']?['name'] as String?,
      nextEpisodeName: show['_links']?['nextepisode']?['name'] as String?,
    );
  }
}
