import 'package:equatable/equatable.dart';

class ChatRoomEntiti extends Equatable {
  final String userId;
  final String uFName;
  final String uLName;
  final String uImage;
  final String roomId;

  ChatRoomEntiti({
    required this.userId,
    required this.uFName,
    required this.uLName,
    required this.uImage,
    required this.roomId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    this.roomId,
    this.uFName,
    this.uLName,
    this.userId,
    this.uImage,
  ];
}
