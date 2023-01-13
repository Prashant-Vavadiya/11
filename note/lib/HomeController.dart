import 'package:get/get.dart';
import 'package:note/HomeModel.dart';
import 'package:note/model/HomeModel.dart';

class HomeController extends GetxController
{
  RxList<Map>stdList=<Map>[].obs;

  model? customerdata;
}
class ProdController extends GetxController
{
  RxList<Map> DataList = <Map>[].obs;

  Datamodel? datamodel;

}