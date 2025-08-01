import 'package:equatable/equatable.dart';

class MessageEntiti extends Equatable {
  final String massege;
  final String senderId;
  final String reciverId;

  MessageEntiti({
    required this.massege,
    required this.senderId,
    required this.reciverId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.massege, this.reciverId, this.senderId];
}
