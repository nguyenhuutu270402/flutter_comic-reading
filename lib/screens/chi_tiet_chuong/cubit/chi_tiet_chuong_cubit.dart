import 'package:bloc/bloc.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/model/list_binh_luan.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/model/list_image.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'chi_tiet_chuong_state.dart';

class ChiTietChuongCubit extends Cubit<ChiTietChuongState> {
  ChiTietChuongCubit() : super(ChiTietChuongInitial());
  final dio = Dio();

  Future<void> initData(int idChuong, int idTruyen, int idNguoiDung) async {
    try {
      emit(ChiTietChuongLoading());

      var listImage = await onGetListImage(idChuong);
      var listBinhLuan = await onGetListComment(idTruyen);

      emit(ChiTietChuongSuccess(
          listImage: listImage, listBinhLuan: listBinhLuan));
    } catch (e) {
      print(e);
      emit(ChiTietChuongFailure(error: e.toString()));
    }
  }

  Future<ListImage> onGetListImage(int idChuong) async {
    try {
      var url =
          'https://app-comic-reading.onrender.com/api/get-get-list-image-chuong-theo-id-chuong/$idChuong';
      var res = await dio.get(url);
      return ListImage.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListBinhLuan> onGetListComment(int idTruyen) async {
    try {
      var url =
          'https://app-comic-reading.onrender.com/api/get-list-binh-luan-theo-id-truyen/$idTruyen';
      var res = await dio.get(url);
      return ListBinhLuan.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
