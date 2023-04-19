import 'package:comic_reading/models/truyen.dart';

abstract class Repository {
  // get
  Future<List<Truyen>> getListTruyen();
  // patch
  Future<String> patchCompleted(Truyen truyen);
  // put
  Future<String> putCompleted(Truyen truyen);
  // delete
  Future<String> deletedCompleted(Truyen truyen);
  // post
  Future<String> postleted(Truyen truyen);
}
