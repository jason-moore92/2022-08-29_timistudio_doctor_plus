import 'package:equatable/equatable.dart';

class AdditionalModel extends Equatable {
  const AdditionalModel({
    this.nameAdditional,
  });
  final String? nameAdditional;

  @override
  List<Object?> get props => [nameAdditional];
}
