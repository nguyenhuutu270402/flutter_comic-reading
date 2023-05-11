part of 'tai_khoan_cubit.dart';

@immutable
abstract class TaiKhoanState {}

class TaiKhoanInitial extends TaiKhoanState {}

class TaiKhoanLoading extends TaiKhoanState {}

class TaiKhoanFailure extends TaiKhoanState {
  final String error;
  TaiKhoanFailure({required this.error});
}

class TaiKhoanSuccess extends TaiKhoanState {
  final dynamic userInfor;
  TaiKhoanSuccess({required this.userInfor});
}
