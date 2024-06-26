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

  ProductEntity copyWith({
    int? id,
    String? nama,
    String? gambar,
    int? harga,
    bool? isSelected,
    int? count,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      gambar: gambar ?? this.gambar,
      harga: harga ?? this.harga,
      isSelected: isSelected ?? this.isSelected,
      count: count ?? this.count,
    );
  }
}
