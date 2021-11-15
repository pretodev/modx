import 'package:get/get.dart';
import 'package:get/get_core/src/get_interface.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:meta/meta.dart';

export 'package:get/get_navigation/src/extension_navigation.dart';

abstract class Controller<Store extends Object> extends GetxController {
  final String? tag = null;

  Store get store => GetInstance().find<Store>(tag: tag);

  @protected
  GetInterface get view => Get;
}
