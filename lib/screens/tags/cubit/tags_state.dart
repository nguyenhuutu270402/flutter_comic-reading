part of 'tags_cubit.dart';

@immutable
abstract class TagsState {}

class TagsInitial extends TagsState {}

class TagsLoading extends TagsState {}

class TagsFailure extends TagsState {
  final String error;
  TagsFailure({required this.error});
}

class TagsSuccess extends TagsState {
  dynamic data;

  TagsSuccess({required this.data});
}
