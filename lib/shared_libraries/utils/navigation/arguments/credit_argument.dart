import 'package:equatable/equatable.dart';

class CreditArgument extends Equatable {
  final String creditName;
  final int movieId;

  const CreditArgument({required this.creditName, required this.movieId});

  @override
  List<Object?> get props => [creditName, movieId];
}
