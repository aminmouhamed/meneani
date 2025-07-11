import 'package:meneani/features/client_profile/domain/entities/client_entiti.dart';

class ClientMode {
  final String fName;
  final String lName;

  ClientMode({required this.fName, required this.lName});
  factory ClientMode.fromJson(Map<dynamic, dynamic> jsonData) {
    return ClientMode(fName: jsonData["uFName"], lName: jsonData["uLName"]);
  }
  Map<String, dynamic> toJson() {
    return {"uFName": this.fName, "uLName": this.lName};
  }

  ClientEntiti toEntiti() {
    return ClientEntiti(fName: this.fName, lName: this.lName);
  }
}
