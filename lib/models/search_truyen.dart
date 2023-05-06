class SearchTruyen {
  List<ResultsSearchTruyen>? results;

  SearchTruyen({this.results});

  SearchTruyen.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ResultsSearchTruyen>[];
      json['results'].forEach((v) {
        results!.add(new ResultsSearchTruyen.fromJson(v));
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

class ResultsSearchTruyen {
  int? id;
  String? tentruyen;
  String? tenkhac;
  int? tinhtrang;
  String? mota;
  String? imagelink;

  ResultsSearchTruyen(
      {this.id,
      this.tentruyen,
      this.tenkhac,
      this.tinhtrang,
      this.mota,
      this.imagelink});

  ResultsSearchTruyen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentruyen = json['tentruyen'];
    tenkhac = json['tenkhac'];
    tinhtrang = json['tinhtrang'];
    mota = json['mota'];
    imagelink = json['imagelink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentruyen'] = this.tentruyen;
    data['tenkhac'] = this.tenkhac;
    data['tinhtrang'] = this.tinhtrang;
    data['mota'] = this.mota;
    data['imagelink'] = this.imagelink;
    return data;
  }
}
