import 'package:equatable/equatable.dart';

class TransactionParams extends Equatable {
  final String inv;
  final String status;
  final String tanggal;
  final int total;
  final int tax;
  final int idUsers;
  final List<DetailTransactionParams> details;

  const TransactionParams({
    required this.inv,
    required this.status,
    required this.tanggal,
    required this.total,
    required this.tax,
    required this.idUsers,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'inv': inv,
      'status': status,
      'tanggal': tanggal,
      'total': total,
      'tax': tax,
      'id_users': idUsers,
      'details': details.map((e) => e.toMap()).toList(),
    };
  }

  factory TransactionParams.fromMap(Map<String, dynamic> map) {
    return TransactionParams(
      inv: map['inv'] as String,
      status: map['status'] as String,
      tanggal: map['tanggal'] as String,
      total: map['total'] as int,
      tax: map['tax'] as int,
      idUsers: map['idUsers'] as int,
      details: map['details'] as List<DetailTransactionParams>,
    );
  }

  @override
  List<Object> get props => [
        inv,
        status,
        tanggal,
        total,
        tax,
        idUsers,
        details,
      ];
}

class DetailTransactionParams {
  final int idProduk;
  final int harga;
  final int qty;
  final int total;

  const DetailTransactionParams({
    required this.idProduk,
    required this.harga,
    required this.qty,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_produk': idProduk,
      'harga': harga,
      'qty': qty,
      'total': total,
    };
  }

  factory DetailTransactionParams.fromMap(Map<String, dynamic> map) {
    return DetailTransactionParams(
      idProduk: map['idProduk'] as int,
      harga: map['harga'] as int,
      qty: map['qty'] as int,
      total: map['total'] as int,
    );
  }
}
