part of 'chi_tiet_cubit.dart';

@immutable
abstract class ChiTietState {}

class ChiTietInitial extends ChiTietState {}

class ChiTietLoading extends ChiTietState {}

class ChiTietFailure extends ChiTietState {
  final String error;
  ChiTietFailure({required this.error});
}

class ChiTietSuccess extends ChiTietState {
  final CT_Truyen ct_truyen;
  final ListChuong listChuong;
  final ListTacGia listTacGia;
  final ListTheLoai listTheLoai;
  ChiTietSuccess(
      {required this.ct_truyen,
      required this.listChuong,
      required this.listTheLoai,
      required this.listTacGia});
}
