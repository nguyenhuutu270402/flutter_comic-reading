import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'the_loai_state.dart';

class TheLoaiCubit extends Cubit<TheLoaiState> {
  TheLoaiCubit() : super(TheLoaiInitial());
}
