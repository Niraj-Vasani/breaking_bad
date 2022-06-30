import 'package:equatable/equatable.dart';

class WebSeriesEntity extends Equatable {
  final String seriesName;
  final String image;
  final double rating;

  const WebSeriesEntity({
    required this.seriesName,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props => [seriesName, image, rating];
}
