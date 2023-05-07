import 'package:comic_reading/common/api/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFunction {
  String formatDateCapNhat(String ngaycapnhat) {
    DateTime dateTimeData = DateTime.parse(ngaycapnhat);
    return '[Cập nhật lúc: ${dateTimeData.hour.toString().padLeft(2, '0')}:${dateTimeData.minute.toString().padLeft(2, '0')} ${dateTimeData.day.toString().padLeft(2, '0')}/${dateTimeData.month.toString().padLeft(2, '0')}/${dateTimeData.year}]';
  }

  Future<bool> onTheoDoi(
      dynamic userInfor, bool isFollow, dynamic idTruyen) async {
    if (userInfor == null) {
      // show error message and return false
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
      // handle error and return false
      EasyLoading.dismiss();
      return false;
    }
  }
}
