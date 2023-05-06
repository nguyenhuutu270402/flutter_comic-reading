import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/shared_prefes/shared_prefes.dart';
import 'package:meta/meta.dart';

part 'danh_muc_state.dart';

class DanhMucCubit extends Cubit<DanhMucState> {
  DanhMucCubit() : super(DanhMucInitial());
  final mySharedPrefes = MySharedPrefes();

  Future<void> initData() async {
    try {
      emit(DanhMucLoading());
      final userInfor = await mySharedPrefes.readUserInfo();
      emit(DanhMucSuccess(userInfor: userInfor));
    } catch (e) {
      print(e);
      emit(DanhMucFailure(error: e.toString()));
    }
  }
}
