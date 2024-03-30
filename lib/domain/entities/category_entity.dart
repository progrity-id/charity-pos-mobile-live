import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String nama;

  const CategoryEntity({
    required this.id,
    required this.nama,
  });

  @override
  List<Object> get props => [id, nama];
}
