import 'package:meneani/features/home/domain/entiti/client_entiti.dart';

class ClientMode {
  final String fName;

  ClientMode({required this.fName});
  factory ClientMode.fromJson(Map<dynamic, dynamic> jsonData) {
    return ClientMode(fName: jsonData["uFName"]);
  }
  Map<String, dynamic> toJson() {
    return {"uFName": this.fName};
  }

  ClientEntiti toEntiti() {
    return ClientEntiti(fName: this.fName);
  }
}
