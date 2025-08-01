import 'package:equatable/equatable.dart';

class SpecialistChatServiceSettingEntiti extends Equatable {
  final bool state;
  final String price;

  SpecialistChatServiceSettingEntiti({
    required this.state,
    required this.price,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.price, this.state];
}
