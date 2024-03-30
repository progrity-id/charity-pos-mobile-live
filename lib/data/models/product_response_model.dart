// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromJson(jsonString);

class ProductResponseModel {
  bool? success;
  Data? data;
  String? message;

  ProductResponseModel({
    this.success,
    this.data,
    this.message,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
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
  DataKategori? dataKategori;
  DataSupplier? dataSupplier;

  Datum({
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
    this.dataKategori,
    this.dataSupplier,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        dataKategori: json["data_kategori"] == null
            ? null
            : DataKategori.fromJson(json["data_kategori"]),
        dataSupplier: json["data_supplier"] == null
            ? null
            : DataSupplier.fromJson(json["data_supplier"]),
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
        "data_kategori": dataKategori?.toJson(),
        "data_supplier": dataSupplier?.toJson(),
      };
}

class DataKategori {
  int? id;
  String? nama;
  String? keterangan;
  DateTime? createdAt;
  DateTime? updatedAt;

  DataKategori({
    this.id,
    this.nama,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
  });

  factory DataKategori.fromJson(Map<String, dynamic> json) => DataKategori(
        id: json["id"],
        nama: json["nama"],
        keterangan: json["keterangan"],
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
        "keterangan": keterangan,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class DataSupplier {
  int? id;
  String? nama;
  String? nomorHp;
  String? email;
  String? alamat;
  String? keterangan;
  DateTime? createdAt;
  DateTime? updatedAt;

  DataSupplier({
    this.id,
    this.nama,
    this.nomorHp,
    this.email,
    this.alamat,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
  });

  factory DataSupplier.fromJson(Map<String, dynamic> json) => DataSupplier(
        id: json["id"],
        nama: json["nama"],
        nomorHp: json["nomor_hp"],
        email: json["email"],
        alamat: json["alamat"],
        keterangan: json["keterangan"],
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
        "nomor_hp": nomorHp,
        "email": email,
        "alamat": alamat,
        "keterangan": keterangan,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
