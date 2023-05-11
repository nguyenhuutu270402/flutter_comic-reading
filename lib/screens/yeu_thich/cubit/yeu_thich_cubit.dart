import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/shared_prefes/shared_prefes.dart';
import 'package:meta/meta.dart';

part 'yeu_thich_state.dart';

class YeuThichCubit extends Cubit<YeuThichState> {
  YeuThichCubit() : super(YeuThichInitial());
  final apiProvider = ApiProvider();
  final mySharedPrefes = MySharedPrefes();

  Future<void> initData() async {
    try {
      emit(YeuThichLoading());
      final userInfor = await mySharedPrefes.readUserInfo();
      var data;
      if (userInfor != null) {
        String lastquery =
            "WHERE theodoi.idnguoidung = ${userInfor["id"]} GROUP BY truyen.id ORDER BY MAX(chuong.ngaycapnhat) desc ";

        data = await apiProvider.layListTruyenTheoLoai(lastquery);
      }
      emit(YeuThichSuccess(data: data, userInfor: userInfor));
    } catch (e) {
      print(e);
      emit(YeuThichFailure(error: e.toString()));
    }
  }
}
