import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:meta/meta.dart';

part 'the_loai_state.dart';

class TheLoaiCubit extends Cubit<TheLoaiState> {
  TheLoaiCubit() : super(TheLoaiInitial());
  final apiProvider = ApiProvider();

  Future<void> initData(String lastquery) async {
    try {
      emit(TheLoaiLoading());
      var data = await apiProvider.layListTruyenTheoLoai(lastquery);
      emit(TheLoaiSuccess(data: data));
    } catch (e) {
      print(e);
      emit(TheLoaiFailure(error: e.toString()));
    }
  }
}
