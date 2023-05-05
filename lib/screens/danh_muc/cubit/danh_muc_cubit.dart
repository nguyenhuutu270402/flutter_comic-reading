import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'danh_muc_state.dart';

class DanhMucCubit extends Cubit<DanhMucState> {
  DanhMucCubit() : super(DanhMucInitial());
}
