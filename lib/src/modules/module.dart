import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

typedef Injector<S> = T Function<T>({String? tag});

mixin Module<AppStore extends Object> on Object {
  AppStore get app => Get.find<AppStore>();

  Widget get view;

  @protected
  void bind<S>(S dependency, {String? tag, bool permanent = false}) {
    Get.put<S>(dependency, tag: tag, permanent: permanent);
  }

  @protected
  void lazyBind<S>(S Function() builder, {String? tag, bool fenix = false}) {
    Get.lazyPut<S>(builder, tag: tag, fenix: fenix);
  }

  void binding(Injector i) {}
}
