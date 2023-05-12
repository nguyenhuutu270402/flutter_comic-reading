import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/shared_prefes/shared_prefes.dart';
import 'package:meta/meta.dart';

part 'lich_su_state.dart';

class LichSuCubit extends Cubit<LichSuState> {
  LichSuCubit() : super(LichSuInitial());
  final apiProvider = ApiProvider();
  final mySharedPrefes = MySharedPrefes();

  Future<void> initData() async {
    try {
      emit(LichSuLoading());
      final userInfor = await mySharedPrefes.readUserInfo();
      var data;
      if (userInfor != null) {
        data = await apiProvider.getListLichSuTheoIdNguoiDung(userInfor["id"]);
      }
      emit(LichSuSuccess(data: data, userInfor: userInfor));
    } catch (e) {
      print(e);
      emit(LichSuFailure(error: e.toString()));
    }
  }
}
