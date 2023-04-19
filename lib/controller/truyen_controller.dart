import 'package:comic_reading/models/truyen.dart';
import 'package:comic_reading/repository/repository.dart';

class TruyenController {
  final Repository _repository;
  TruyenController(this._repository);

  //get
  Future<List<Truyen>> fechListTruyen() async {
    return _repository.getListTruyen();
  }
}
