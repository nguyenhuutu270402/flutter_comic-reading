import 'package:bloc/bloc.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:meta/meta.dart';

part 'tags_state.dart';

class TagsCubit extends Cubit<TagsState> {
  TagsCubit() : super(TagsInitial());

  final apiProvider = ApiProvider();

  Future<void> initData() async {
    try {
      emit(TagsLoading());

      var data = await apiProvider.getListTheLoai();
      emit(TagsSuccess(data: data));
    } catch (e) {
      print(e);
      emit(TagsFailure(error: e.toString()));
    }
  }
}
