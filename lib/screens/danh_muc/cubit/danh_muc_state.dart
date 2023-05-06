part of 'danh_muc_cubit.dart';

@immutable
abstract class DanhMucState {}

class DanhMucInitial extends DanhMucState {}

class DanhMucLoading extends DanhMucState {}

class DanhMucFailure extends DanhMucState {
  final String error;
  DanhMucFailure({required this.error});
}

class DanhMucSuccess extends DanhMucState {
  final dynamic userInfor;
  DanhMucSuccess({required this.userInfor});
}
