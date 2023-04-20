part of 'chi_tiet_chuong_cubit.dart';

@immutable
abstract class ChiTietChuongState {}

class ChiTietChuongInitial extends ChiTietChuongState {}

class ChiTietChuongLoading extends ChiTietChuongState {}

class ChiTietChuongFailure extends ChiTietChuongState {
  final String error;
  ChiTietChuongFailure({required this.error});
}

class ChiTietChuongSuccess extends ChiTietChuongState {
  final ListBinhLuan listBinhLuan;
  final ListImage listImage;
  // final ListTacGia listTacGia;
  // final ListTheLoai listTheLoai;
  ChiTietChuongSuccess({
    required this.listImage,
    required this.listBinhLuan,
  });
}
