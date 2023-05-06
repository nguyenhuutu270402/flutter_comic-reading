class ListTheLoai {
  List<ResultsTheLoai>? results;

  ListTheLoai({this.results});

  ListTheLoai.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ResultsTheLoai>[];
      json['results'].forEach((v) {
        results!.add(new ResultsTheLoai.fromJson(v));
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

class ResultsTheLoai {
  int? id;
  String? tentheloai;
  String? mota;

  ResultsTheLoai({this.id, this.tentheloai, this.mota});

  ResultsTheLoai.fromJson(Map<String, dynamic> json) {
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
