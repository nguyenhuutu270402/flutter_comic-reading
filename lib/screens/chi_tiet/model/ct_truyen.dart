class CT_Truyen {
  Results? results;

  CT_Truyen({this.results});

  CT_Truyen.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  num? id;
  String? tentruyen;
  String? tenkhac;
  num? tinhtrang;
  String? mota;
  String? imagelink;
  num? tongluotxem;
  num? tongtheodoi;
  num? tongdanhgia;
  num? tongbinhluan;
  num? sosaotrungbinh;
  String? ngaycapnhat;
  num? chuongmoinhat;

  Results(
      {this.id,
      this.tentruyen,
      this.tenkhac,
      this.tinhtrang,
      this.mota,
      this.imagelink,
      this.tongluotxem,
      this.tongtheodoi,
      this.tongdanhgia,
      this.tongbinhluan,
      this.sosaotrungbinh,
      this.ngaycapnhat,
      this.chuongmoinhat});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentruyen = json['tentruyen'];
    tenkhac = json['tenkhac'];
    tinhtrang = json['tinhtrang'];
    mota = json['mota'];
    imagelink = json['imagelink'];
    tongluotxem = json['tongluotxem'];
    tongtheodoi = json['tongtheodoi'];
    tongdanhgia = json['tongdanhgia'];
    tongbinhluan = json['tongbinhluan'];
    sosaotrungbinh = json['sosaotrungbinh'];
    ngaycapnhat = json['ngaycapnhat'];
    chuongmoinhat = json['chuongmoinhat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentruyen'] = this.tentruyen;
    data['tenkhac'] = this.tenkhac;
    data['tinhtrang'] = this.tinhtrang;
    data['mota'] = this.mota;
    data['imagelink'] = this.imagelink;
    data['tongluotxem'] = this.tongluotxem;
    data['tongtheodoi'] = this.tongtheodoi;
    data['tongdanhgia'] = this.tongdanhgia;
    data['tongbinhluan'] = this.tongbinhluan;
    data['sosaotrungbinh'] = this.sosaotrungbinh;
    data['ngaycapnhat'] = this.ngaycapnhat;
    data['chuongmoinhat'] = this.chuongmoinhat;
    return data;
  }
}
