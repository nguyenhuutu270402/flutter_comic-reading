import 'package:bloc/bloc.dart';
import 'package:comic_reading/screens/chi_tiet/model/ct_truyen.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'chi_tiet_state.dart';

class ChiTietCubit extends Cubit<ChiTietState> {
  ChiTietCubit() : super(ChiTietInitial());
  final dio = Dio();

  Future<void> initData(int id) async {
    try {
      emit(ChiTietLoading());
      var ct_truyen = await onGetOneTruyenByID(id);

      emit(ChiTietSuccess(ct_truyen: ct_truyen));
    } catch (e) {
      print(e);
      emit(ChiTietFailure(error: e.toString()));
    }
  }

  Future<CT_Truyen> onGetOneTruyenByID(int id) async {
    try {
      var url =
          'https://app-comic-reading.onrender.com/api/get-one-truyen-by-id/$id';
      var res = await dio.get(url);
      print(res);
      return CT_Truyen.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
