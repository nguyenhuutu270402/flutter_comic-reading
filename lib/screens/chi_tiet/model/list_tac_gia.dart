class ListTacGia {
  List<Results>? results;

  ListTacGia({this.results});

  ListTacGia.fromJson(Map<String, dynamic> json) {
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
  String? tentacgia;

  Results({this.id, this.tentacgia});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentacgia = json['tentacgia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentacgia'] = this.tentacgia;
    return data;
  }
}
