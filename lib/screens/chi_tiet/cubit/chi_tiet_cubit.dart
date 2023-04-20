import 'package:bloc/bloc.dart';
import 'package:comic_reading/screens/chi_tiet/model/ct_truyen.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_tac_gia.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_the_loai.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'chi_tiet_state.dart';

class ChiTietCubit extends Cubit<ChiTietState> {
  ChiTietCubit() : super(ChiTietInitial());
  final dio = Dio();

  Future<void> initData(int id, int idNguoiDung) async {
    try {
      emit(ChiTietLoading());
      var ct_truyen = await onGetOneTruyenByID(id);
      var listChuong = await onGetListChuong(id, idNguoiDung);
      var listTheLoai = await onGetListTheLoai(id);
      var listTacGia = await onGetListTacGia(id);

      emit(ChiTietSuccess(
          ct_truyen: ct_truyen,
          listChuong: listChuong,
          listTheLoai: listTheLoai,
          listTacGia: listTacGia));
    } catch (e) {
      emit(ChiTietFailure(error: e.toString()));
    }
  }

  Future<CT_Truyen> onGetOneTruyenByID(int id) async {
    try {
      var url =
          'https://app-comic-reading.onrender.com/api/get-one-truyen-by-id/$id';

      var res = await dio.get(url);
      return CT_Truyen.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListChuong> onGetListChuong(int id, int idNguoiDung) async {
    try {
      var url =
          'https://app-comic-reading.onrender.com/api/get-list-chuong-theo-id-truyen/$id/$idNguoiDung';

      var res = await dio.get(url);
      return ListChuong.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListTheLoai> onGetListTheLoai(int id) async {
    try {
      var url =
          'https://app-comic-reading.onrender.com/api/get-list-the-loai-theo-id-truyen/$id';
      var res = await dio.get(url);
      return ListTheLoai.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListTacGia> onGetListTacGia(int id) async {
    try {
      var url =
          'https://app-comic-reading.onrender.com/api/get-list-tac-gia-theo-id-truyen/$id';
      var res = await dio.get(url);
      return ListTacGia.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
