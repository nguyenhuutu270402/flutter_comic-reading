import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/screens/trang_chu/model/truyen.dart';
import 'package:meta/meta.dart';

part 'trang_chu_state.dart';

class TrangChuCubit extends Cubit<TrangChuState> {
  TrangChuCubit() : super(TrangChuInitial());
  final apiProvider = ApiProvider();

  Future<void> initData() async {
    try {
      emit(TrangChuLoading());
      var data = await apiProvider.onGetAllTruyen();
      var data2 = await apiProvider.onGetTop10Truyen();

      emit(TrangChuSuccess(data: data, data2: data2));
    } catch (e) {
      print(e);
      emit(TrangChuFailure(error: e.toString()));
    }
  }
}
