import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String nama;
  final String gambar;
  final int harga;
  final bool isSelected;
  final int count;

  const ProductEntity({
    required this.id,
    required this.nama,
    required this.gambar,
    required this.harga,
    required this.isSelected,
    required this.count,
  });

  @override
  List<Object> get props => [id, nama, gambar, harga, isSelected, count];
}
