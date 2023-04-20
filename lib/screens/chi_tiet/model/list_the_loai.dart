class ListTheLoai {
  List<Results>? results;

  ListTheLoai({this.results});

  ListTheLoai.fromJson(Map<String, dynamic> json) {
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
  String? tentheloai;
  String? mota;

  Results({this.id, this.tentheloai, this.mota});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentheloai = json['tentheloai'];
    mota = json['mota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentheloai'] = this.tentheloai;
    data['mota'] = this.mota;
    return data;
  }
}
