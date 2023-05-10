import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:meta/meta.dart';

part 'xep_hang_state.dart';

class XepHangCubit extends Cubit<XepHangState> {
  XepHangCubit() : super(XepHangInitial());

  final apiProvider = ApiProvider();

  Future<void> initData() async {
    try {
      emit(XepHangLoading());
      String lastquery =
          "GROUP BY truyen.id ORDER BY COUNT(DISTINCT luotxem.id) DESC";
      var data = await apiProvider.layListTruyenTheoLoai(lastquery);
      emit(XepHangSuccess(data: data));
    } catch (e) {
      print(e);
      emit(XepHangFailure(error: e.toString()));
    }
  }
}
