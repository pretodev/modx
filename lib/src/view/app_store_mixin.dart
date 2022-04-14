import 'package:get/get.dart';

mixin ModxAppStoreMixin<T> {
  T get app => GetInstance().find<T>();
}
