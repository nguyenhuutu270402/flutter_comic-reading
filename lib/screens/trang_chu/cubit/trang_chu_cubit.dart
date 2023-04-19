import 'package:bloc/bloc.dart';
import 'package:comic_reading/screens/trang_chu/model/truyen.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'trang_chu_state.dart';

class TrangChuCubit extends Cubit<TrangChuState> {
  TrangChuCubit() : super(TrangChuInitial());
  final dio = Dio();

  Future<void> initData() async {
    try {
      emit(TrangChuLoading());
      var data = await onGetAllTruyen();
      var data2 = await onGetTop10Truyen();

      emit(TrangChuSuccess(data: data, data2: data2));
    } catch (e) {
      print(e);
      emit(TrangChuFailure(error: e.toString()));
    }
  }

  Future<Truyen> onGetAllTruyen() async {
    try {
      var url = 'https://app-comic-reading.onrender.com/api/get-all-truyen';
      var res = await dio.get(url);
      return Truyen.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  onGetTop10Truyen() async {
    try {
      var url = 'https://app-comic-reading.onrender.com/api/get-top10-truyen';
      var res = await dio.get(url);
      return Truyen.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
