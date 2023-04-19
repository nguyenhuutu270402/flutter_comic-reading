import 'dart:convert';

import 'package:comic_reading/models/truyen.dart';
import 'package:comic_reading/repository/repository.dart';
import 'package:dio/dio.dart';

class TruyenRepository implements Repository {
  String dataURL = 'https://app-comic-reading.onrender.com/api';
  @override
  Future<String> deletedCompleted(Truyen truyen) {
    // TODO: implement deletedCompleted
    throw UnimplementedError();
  }

  @override
  Future<List<Truyen>> getListTruyen() async {
    // TODO: implement getListTruyen
    List<Truyen> listTruyen = [];
    var url = '$dataURL/get-all-truyen';
    var response = await Dio().get(url);
    print('status code: ${response.statusCode}');
    var body = json.decode(response.data);
    // parse
    for (var i = 0; i < body.lenght; i++) {
      listTruyen.add(Truyen.fromJson(body[i]));
    }
    return listTruyen;
    // throw UnimplementedError();
  }

  @override
  Future<String> patchCompleted(Truyen truyen) {
    // TODO: implement patchCompleted
    throw UnimplementedError();
  }

  @override
  Future<String> postleted(Truyen truyen) {
    // TODO: implement postleted
    throw UnimplementedError();
  }

  @override
  Future<String> putCompleted(Truyen truyen) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }
}
