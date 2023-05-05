import 'package:bloc/bloc.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/model/list_binh_luan.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/model/list_image.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:meta/meta.dart';

part 'chi_tiet_chuong_state.dart';

class ChiTietChuongCubit extends Cubit<ChiTietChuongState> {
  ChiTietChuongCubit() : super(ChiTietChuongInitial());
  final apiProvider = ApiProvider();

  Future<void> initData(int idChuong, int idTruyen, int idNguoiDung) async {
    try {
      emit(ChiTietChuongLoading());

      var listImage = await apiProvider.onGetListImage(idChuong);
      var listBinhLuan = await apiProvider.onGetListComment(idTruyen);
      var listChuong = await apiProvider.onGetListChuong(idTruyen, idNguoiDung);

      emit(ChiTietChuongSuccess(
          listImage: listImage,
          listBinhLuan: listBinhLuan,
          listChuong: listChuong));
    } catch (e) {
      print(e);
      emit(ChiTietChuongFailure(error: e.toString()));
    }
  }
}
