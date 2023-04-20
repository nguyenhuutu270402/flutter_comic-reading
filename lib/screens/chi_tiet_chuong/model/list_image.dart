class ListImage {
  List<Results>? results;

  ListImage({this.results});

  ListImage.fromJson(Map<String, dynamic> json) {
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
  String? imagelink;
  int? idchuong;

  Results({this.id, this.imagelink, this.idchuong});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagelink = json['imagelink'];
    idchuong = json['idchuong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imagelink'] = this.imagelink;
    data['idchuong'] = this.idchuong;
    return data;
  }
}
