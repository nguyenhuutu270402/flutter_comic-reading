import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/shared_prefes/shared_prefes.dart';
import 'package:meta/meta.dart';

part 'tai_khoan_state.dart';

class TaiKhoanCubit extends Cubit<TaiKhoanState> {
  TaiKhoanCubit() : super(TaiKhoanInitial());
  final mySharedPrefes = MySharedPrefes();

  Future<void> initData() async {
    try {
      emit(TaiKhoanLoading());
      final userInfor = await mySharedPrefes.readUserInfo();
      emit(TaiKhoanSuccess(userInfor: userInfor));
    } catch (e) {
      print(e);
      emit(TaiKhoanFailure(error: e.toString()));
    }
  }
}
