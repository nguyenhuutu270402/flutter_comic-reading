import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/screens/chi_tiet/model/ct_truyen.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_tac_gia.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_the_loai.dart';
import 'package:meta/meta.dart';

part 'chi_tiet_state.dart';

class ChiTietCubit extends Cubit<ChiTietState> {
  ChiTietCubit() : super(ChiTietInitial());
  final apiProvider = ApiProvider();

  Future<void> initData(int id, int idNguoiDung) async {
    try {
      emit(ChiTietLoading());
      var ct_truyen = await apiProvider.onGetOneTruyenByID(id);
      var listChuong = await apiProvider.onGetListChuong(id, idNguoiDung);
      var listTheLoai = await apiProvider.onGetListTheLoai(id);
      var listTacGia = await apiProvider.onGetListTacGia(id);

      emit(ChiTietSuccess(
          ct_truyen: ct_truyen,
          listChuong: listChuong,
          listTheLoai: listTheLoai,
          listTacGia: listTacGia));
    } catch (e) {
      emit(ChiTietFailure(error: e.toString()));
    }
  }
}
