import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final int id;
  final String nama;
  final int harga;
  final String gambar;
  final int count;

  const CartEntity({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.count,
  });

  @override
  List<Object> get props => [id, nama, gambar, count, harga];

  CartEntity copyWith({
    int? id,
    String? nama,
    String? gambar,
    int? count,
    int? harga,
  }) {
    return CartEntity(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      gambar: gambar ?? this.gambar,
      count: count ?? this.count,
      harga: harga ?? this.harga,
    );
  }
}
