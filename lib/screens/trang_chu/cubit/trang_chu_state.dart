part of 'trang_chu_cubit.dart';

@immutable
abstract class TrangChuState {}

class TrangChuInitial extends TrangChuState {}

class TrangChuLoading extends TrangChuState {}

class TrangChuFailure extends TrangChuState {
  final String error;
  TrangChuFailure({required this.error});
}

class TrangChuSuccess extends TrangChuState {
  final Truyen data;
  TrangChuSuccess({required this.data});
}
