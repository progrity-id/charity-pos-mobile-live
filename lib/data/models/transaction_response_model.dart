// To parse this JSON data, do
//
//     final transactionResponseModel = transactionResponseModelFromJson(jsonString);

class TransactionResponseModel {
  bool? success;
  List<Datum>? data;
  String? message;

  TransactionResponseModel({
    this.success,
    this.data,
    this.message,
  });

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionResponseModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int? id;
  String? inv;
  DateTime? tanggal;
  String? total;
  String? status;
  String? idUsers;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? tax;
  String? metodeBayar;
  List<DataTransaksiDetail>? dataTransaksiDetail;

  Datum({
    this.id,
    this.inv,
    this.tanggal,
    this.total,
    this.status,
    this.idUsers,
    this.createdAt,
    this.updatedAt,
    this.tax,
    this.metodeBayar,
    this.dataTransaksiDetail,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        inv: json["inv"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        total: json["total"],
        status: json["status"],
        idUsers: json["id_users"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        tax: json["tax"],
        metodeBayar: json["metode_bayar"],
        dataTransaksiDetail: json["data_transaksi_detail"] == null
            ? []
            : List<DataTransaksiDetail>.from(json["data_transaksi_detail"]!
                .map((x) => DataTransaksiDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "inv": inv,
        "tanggal": tanggal?.toIso8601String(),
        "total": total,
        "status": status,
        "id_users": idUsers,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tax": tax,
        "metode_bayar": metodeBayar,
        "data_transaksi_detail": dataTransaksiDetail == null
            ? []
            : List<dynamic>.from(dataTransaksiDetail!.map((x) => x.toJson())),
      };
}

class DataTransaksiDetail {
  int? id;
  String? idTransaksi;
  String? idProduk;
  String? qty;
  String? total;
  String? harga;
  DateTime? createdAt;
  DateTime? updatedAt;
  DataProduk? dataProduk;

  DataTransaksiDetail({
    this.id,
    this.idTransaksi,
    this.idProduk,
    this.qty,
    this.total,
    this.harga,
    this.createdAt,
    this.updatedAt,
    this.dataProduk,
  });

  factory DataTransaksiDetail.fromJson(Map<String, dynamic> json) =>
      DataTransaksiDetail(
        id: json["id"],
        idTransaksi: json["id_transaksi"],
        idProduk: json["id_produk"],
        qty: json["qty"],
        total: json["total"],
        harga: json["harga"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        dataProduk: json["data_produk"] == null
            ? null
            : DataProduk.fromJson(json["data_produk"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_transaksi": idTransaksi,
        "id_produk": idProduk,
        "qty": qty,
        "total": total,
        "harga": harga,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "data_produk": dataProduk?.toJson(),
      };
}

class DataProduk {
  int? id;
  String? nama;
  String? gambar;
  String? harga;
  String? sn;
  String? stock;
  String? idSupplier;
  String? idKategori;
  DateTime? createdAt;
  DateTime? updatedAt;

  DataProduk({
    this.id,
    this.nama,
    this.gambar,
    this.harga,
    this.sn,
    this.stock,
    this.idSupplier,
    this.idKategori,
    this.createdAt,
    this.updatedAt,
  });

  factory DataProduk.fromJson(Map<String, dynamic> json) => DataProduk(
        id: json["id"],
        nama: json["nama"],
        gambar: json["gambar"],
        harga: json["harga"],
        sn: json["sn"],
        stock: json["stock"],
        idSupplier: json["id_supplier"],
        idKategori: json["id_kategori"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "gambar": gambar,
        "harga": harga,
        "sn": sn,
        "stock": stock,
        "id_supplier": idSupplier,
        "id_kategori": idKategori,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
