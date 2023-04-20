class ListBinhLuan {
  List<Results>? results;

  ListBinhLuan({this.results});

  ListBinhLuan.fromJson(Map<String, dynamic> json) {
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
  int? idnguoidung;
  int? idtruyen;
  String? noidung;
  String? ngaybinhluan;
  String? tennguoidung;
  String? avatar;

  Results(
      {this.id,
      this.idnguoidung,
      this.idtruyen,
      this.noidung,
      this.ngaybinhluan,
      this.tennguoidung,
      this.avatar});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idnguoidung = json['idnguoidung'];
    idtruyen = json['idtruyen'];
    noidung = json['noidung'];
    ngaybinhluan = json['ngaybinhluan'];
    tennguoidung = json['tennguoidung'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idnguoidung'] = this.idnguoidung;
    data['idtruyen'] = this.idtruyen;
    data['noidung'] = this.noidung;
    data['ngaybinhluan'] = this.ngaybinhluan;
    data['tennguoidung'] = this.tennguoidung;
    data['avatar'] = this.avatar;
    return data;
  }
}
