import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/widgets/comment_sliding_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFunction {
  String formatDateCapNhat(String ngaycapnhat) {
    DateTime dateTimeData = DateTime.parse(ngaycapnhat);
    return '[Cập nhật lúc: ${dateTimeData.hour.toString().padLeft(2, '0')}:${dateTimeData.minute.toString().padLeft(2, '0')} ${dateTimeData.day.toString().padLeft(2, '0')}/${dateTimeData.month.toString().padLeft(2, '0')}/${dateTimeData.year}]';
  }

  String formatDateTime(String dateString) {
    DateTime dateCurr = DateTime.now();
    DateTime dateTimeData = DateTime.parse(dateString);
    int intDateCurr = dateCurr.millisecondsSinceEpoch;
    int intDateData = dateTimeData.millisecondsSinceEpoch;
    int hieuSoDateTime = intDateCurr - intDateData;
    if (hieuSoDateTime < 3600000 && hieuSoDateTime > 0) {
      var minute = (hieuSoDateTime / 60000);
      return '${minute.toInt()} phút trước';
    } else if (hieuSoDateTime < 86400000 && hieuSoDateTime > 0) {
      var hours = (hieuSoDateTime / 3600000);
      return '${hours.toInt()} giờ trước';
    } else if (hieuSoDateTime < 2592000000) {
      var date = (hieuSoDateTime / 86400000);
      return '${date.toInt()}  ngày trước';
    } else if (hieuSoDateTime > 2592000000) {
      var date = dateTimeData.day;
      var month = dateTimeData.month;
      var year = dateTimeData.year;
      String dateFormat =
          '${date.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year}';
      return dateFormat;
    }
    return 'Null';
  }

  Future<bool> onTheoDoi(dynamic userInfor, bool isFollow, int idTruyen) async {
    if (userInfor == null) {
      Fluttertoast.showToast(
        msg: "Chưa đăng nhập",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return false;
    }
    EasyLoading.show(status: 'Loading...');
    try {
      if (isFollow == false) {
        await ApiProvider().addTheoDoi(userInfor['id'], idTruyen);
      } else {
        await ApiProvider().deleteTheoDoi(userInfor['id'], idTruyen);
      }
      EasyLoading.dismiss();
      return true;
    } catch (e) {
      EasyLoading.dismiss();
      return false;
    }
  }

  Future<dynamic> addLuotXem(
      dynamic userInfor, int idChuong, int idTruyen) async {
    if (userInfor == null) {
      await ApiProvider().addLuotXem(1, idChuong);
    } else {
      await ApiProvider().addLuotXem(userInfor['id'], idChuong);
      await ApiProvider().kiemTraLichSu(userInfor['id'], idTruyen, idChuong);
      await ApiProvider().kiemTraLichSuXemChuong(userInfor['id'], idChuong);
    }
  }

  Future<dynamic> addBinhLuan(dynamic userInfor, int idTruyen, String noidung,
      BuildContext context) async {
    EasyLoading.show(status: 'Loading...');
    var data;
    if (userInfor != null) {
      await ApiProvider().addBinhLuan(userInfor['id'], idTruyen, noidung);
      data = await ApiProvider().onGetListComment(idTruyen);
      // Navigator.pop(context);
      // showMySlidingSheet(context, data.results!, userInfor, idTruyen);
    }
    EasyLoading.dismiss();
    return data.results;
  }
}
