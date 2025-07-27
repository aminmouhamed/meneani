import 'package:equatable/equatable.dart';

class Time extends Equatable {
  final int hore;
  final int min;

  Time({required this.hore, required this.min});

  @override
  // TODO: implement props
  List<Object?> get props => [this.hore, this.min];
}
