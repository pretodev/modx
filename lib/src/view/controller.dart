import 'package:get/get.dart';
import 'package:meta/meta.dart';

export 'package:get/get_navigation/src/extension_navigation.dart';

abstract class ModxController<Store extends Object> extends GetxController {
  final String? tag = null;

  Store get store => GetInstance().find<Store>(tag: tag);

  @protected
  GetInterface get view => Get;
}
