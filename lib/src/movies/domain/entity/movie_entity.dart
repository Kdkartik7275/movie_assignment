class MovieEntity {
  final double score;
  final int id;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final String? scheduleTime;
  final List<String>? scheduleDays;
  final double? rating;
  final int weight;
  final String? networkName;
  final String? networkCountry;
  final String? imageMedium;
  final String? imageOriginal;
  final String? summary;
  final String? imdbId;
  final String? previousEpisodeName;
  final String? nextEpisodeName;

  MovieEntity({
    required this.score,
    required this.id,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.scheduleTime,
    this.scheduleDays,
    this.rating,
    required this.weight,
    this.networkName,
    this.networkCountry,
    this.imageMedium,
    this.imageOriginal,
    this.summary,
    this.imdbId,
    this.previousEpisodeName,
    this.nextEpisodeName,
  });
}
