part of 'yeu_thich_cubit.dart';

@immutable
abstract class YeuThichState {}

class YeuThichInitial extends YeuThichState {}

class YeuThichLoading extends YeuThichState {}

class YeuThichFailure extends YeuThichState {
  final String error;
  YeuThichFailure({required this.error});
}

class YeuThichSuccess extends YeuThichState {
  final data;
  final userInfor;

  YeuThichSuccess({required this.data, required this.userInfor});
}
