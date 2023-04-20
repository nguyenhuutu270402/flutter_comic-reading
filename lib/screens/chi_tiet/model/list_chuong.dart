class ListChuong {
  List<Results>? results;

  ListChuong({this.results});

  ListChuong.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? tenchuong;
  int? sochuong;
  String? ngaycapnhat;
  int? idtruyen;
  int? idnguoidungDaDoc;
  int? tongsoluot;

  Results(
      {this.id,
      this.tenchuong,
      this.sochuong,
      this.ngaycapnhat,
      this.idtruyen,
      this.idnguoidungDaDoc,
      this.tongsoluot});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenchuong = json['tenchuong'];
    sochuong = json['sochuong'];
    ngaycapnhat = json['ngaycapnhat'];
    idtruyen = json['idtruyen'];
    idnguoidungDaDoc = json['idnguoidung_da_doc'];
    tongsoluot = json['tongsoluot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenchuong'] = this.tenchuong;
    data['sochuong'] = this.sochuong;
    data['ngaycapnhat'] = this.ngaycapnhat;
    data['idtruyen'] = this.idtruyen;
    data['idnguoidung_da_doc'] = this.idnguoidungDaDoc;
    data['tongsoluot'] = this.tongsoluot;
    return data;
  }
}
