part of 'the_loai_cubit.dart';

@immutable
abstract class TheLoaiState {}

class TheLoaiInitial extends TheLoaiState {}

class TheLoaiLoading extends TheLoaiState {}

class TheLoaiFailure extends TheLoaiState {
  final String error;
  TheLoaiFailure({required this.error});
}

class TheLoaiSuccess extends TheLoaiState {
  final data;

  TheLoaiSuccess({required this.data});
}
