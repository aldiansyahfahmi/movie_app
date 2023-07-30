import 'package:equatable/equatable.dart';

class AllMoviesArgument extends Equatable {
  final String movieType;

  const AllMoviesArgument({required this.movieType});
  @override
  List<Object?> get props => [movieType];
}
