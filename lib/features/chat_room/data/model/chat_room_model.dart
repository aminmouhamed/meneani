import 'package:flutter/foundation.dart';
import 'package:naji/core/const/user_public_data.dart';
import 'package:naji/features/chat_room/domain/entiti/chat_room_entiti.dart';

class ChatRoomModel {
  final String userId;
  final String uFName;
  final String uLName;
  final String uImage;
  final String roomId;

  ChatRoomModel({
    required this.roomId,
    required this.uFName,
    required this.uImage,
    required this.uLName,
    required this.userId,
  });
  factory ChatRoomModel.fromJson(Map<String, dynamic> jsonData) {
    final UserPublicData _userData = UserPublicData.instence;
    String _userType = _userData.UserType == "client" ? "specialist" : "client";
    return ChatRoomModel(
      roomId: jsonData["room_id"],
      userId: jsonData[_userType]["id"],
      uFName: jsonData[_userType]["uFName"],
      uLName: jsonData[_userType]["uLName"],
      uImage: jsonData[_userType]["image"],
    );
  }

  ChatRoomEntiti toEntiti() {
    return ChatRoomEntiti(
      userId: this.userId,
      uFName: this.uFName,
      uLName: this.uLName,
      uImage: this.uImage,
      roomId: this.roomId,
    );
  }
}
