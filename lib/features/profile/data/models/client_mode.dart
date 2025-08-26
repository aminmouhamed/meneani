import 'package:naji/features/profile/domain/entities/client_entiti.dart';

class ClientMode {
  final String fName;
  final String lName;
  final String image;
  ClientMode({required this.fName, required this.lName, required this.image});
  factory ClientMode.fromJson(Map<dynamic, dynamic> jsonData) {
    return ClientMode(
      fName: jsonData["uFName"],
      lName: jsonData["uLName"],
      image: jsonData["image"],
    );
  }
  Map<String, dynamic> toJson() {
    return {"uFName": this.fName, "uLName": this.lName};
  }

  ClientEntiti toEntiti() {
    return ClientEntiti(
      fName: this.fName,
      lName: this.lName,
      image: this.image,
    );
  }
}
