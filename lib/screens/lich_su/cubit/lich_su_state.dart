part of 'lich_su_cubit.dart';

@immutable
abstract class LichSuState {}

class LichSuInitial extends LichSuState {}

class LichSuLoading extends LichSuState {}

class LichSuFailure extends LichSuState {
  final String error;
  LichSuFailure({required this.error});
}

class LichSuSuccess extends LichSuState {
  final data;
  final userInfor;

  LichSuSuccess({required this.data, required this.userInfor});
}
