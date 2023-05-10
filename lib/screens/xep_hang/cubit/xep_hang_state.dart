part of 'xep_hang_cubit.dart';

@immutable
abstract class XepHangState {}

class XepHangInitial extends XepHangState {}

class XepHangLoading extends XepHangState {}

class XepHangFailure extends XepHangState {
  final String error;
  XepHangFailure({required this.error});
}

class XepHangSuccess extends XepHangState {
  dynamic data;

  XepHangSuccess({required this.data});
}
