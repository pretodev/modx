import 'package:get/get.dart';

import 'module.dart';

abstract class ModxPage<AppStore extends Object> with Module {
  String get route;

  Map<String, dynamic> get args => Get.arguments ?? {};

  GetPage get page {
    return GetPage(
      name: route,
      page: () => view,
      binding: _BindingsBuilder(binding),
    );
  }
}

class _BindingsBuilder extends Bindings {
  final void Function(Injector) builder;

  _BindingsBuilder(this.builder);

  @override
  void dependencies() {
    builder(Get.find);
  }
}
