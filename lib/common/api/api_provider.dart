import 'package:dio/dio.dart';
import 'package:comic_reading/screens/trang_chu/model/truyen.dart';
import 'package:comic_reading/screens/chi_tiet/model/ct_truyen.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_tac_gia.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_the_loai.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/model/list_binh_luan.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/model/list_image.dart';

class ApiProvider {
  Dio dio = Dio();

  // chạy sever trên local
  // mở cmd gõ ipconfig copy dòng IPv4 Address quăn vô http://IPv4 Address:3000/
  final baseUrl = 'http://192.168.43.213:3000/api';

  // final baseUrl = 'https://app-comic-reading.onrender.com/api';

  Future<Truyen> onGetAllTruyen() async {
    try {
      var url = '$baseUrl/get-all-truyen';
      var res = await dio.get(url);
      return Truyen.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Truyen> onGetTop10Truyen() async {
    try {
      var url = '$baseUrl/get-top10-truyen';
      var res = await dio.get(url);
      return Truyen.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CT_Truyen> onGetOneTruyenByID(int id) async {
    try {
      var url = '$baseUrl/get-one-truyen-by-id/$id';

      var res = await dio.get(url);
      return CT_Truyen.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListChuong> onGetListChuong(int id, int idNguoiDung) async {
    try {
      var url = '$baseUrl/get-list-chuong-theo-id-truyen/$id/$idNguoiDung';

      var res = await dio.get(url);
      return ListChuong.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListTheLoai> onGetListTheLoai(int id) async {
    try {
      var url = '$baseUrl/get-list-the-loai-theo-id-truyen/$id';
      var res = await dio.get(url);
      return ListTheLoai.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListTacGia> onGetListTacGia(int id) async {
    try {
      var url = '$baseUrl/get-list-tac-gia-theo-id-truyen/$id';
      var res = await dio.get(url);
      return ListTacGia.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListImage> onGetListImage(int idChuong) async {
    try {
      var url = '$baseUrl/get-get-list-image-chuong-theo-id-chuong/$idChuong';
      var res = await dio.get(url);
      return ListImage.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListBinhLuan> onGetListComment(int idTruyen) async {
    try {
      var url = '$baseUrl/get-list-binh-luan-theo-id-truyen/$idTruyen';
      var res = await dio.get(url);
      return ListBinhLuan.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  // Các phương thức gọi API khác ở đây...
  // Future<Response> postData(dynamic data) async {
  //   final response = await dio.post('$baseUrl/some-endpoint', data: data);
  //   return response;
  // }

  Future<Response> checkRegister(String email) async {
    final data = {'email': email};
    final response = await dio.post('$baseUrl/check-register', data: data);
    return response;
  }

  Future<Response> addUser(String email, String matkhau) async {
    final data = {'email': email, 'matkhau': matkhau};
    final response = await dio.post('$baseUrl/add-user', data: data);
    return response;
  }

  Future<Response> loginUser(String email, String matkhau) async {
    final data = {'email': email, 'matkhau': matkhau};
    final response = await dio.post('$baseUrl/login', data: data);
    return response;
  }
}
