import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

typedef Injector<S> = T Function<T>({String? tag});

mixin Module<AppStore extends Object> on Object {
  AppStore get app => Get.find<AppStore>();

  Widget get view;

  @protected
  void bind<S>(S dependency, {String? tag}) {
    Get.put<S>(dependency, tag: tag);
  }

  void binding(Injector i) {}
}
