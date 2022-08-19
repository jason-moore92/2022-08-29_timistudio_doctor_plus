import 'package:equatable/equatable.dart';

class WithDrawModel extends Equatable {
  const WithDrawModel(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.price});
  final int id;
  final String title;
  final String subTitle;
  final int price;

  @override
  List<Object?> get props => [id, title, subTitle, price];
}
