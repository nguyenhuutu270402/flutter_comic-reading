import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'xep_hang_state.dart';

class XepHangCubit extends Cubit<XepHangState> {
  XepHangCubit() : super(XepHangInitial());

  final apiProvider = ApiProvider();

  Future<void> initData(String lastquery) async {
    try {
      emit(XepHangLoading());
      var data = await apiProvider.layListTruyenTheoLoai(lastquery);
      emit(XepHangSuccess(data: data));
    } catch (e) {
      print(e);
      emit(XepHangFailure(error: e.toString()));
    }
  }
}
