import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

abstract class ModxModal<ControllerInterface extends ModxController,
    Store extends Object> {
  Widget buildView(BuildContext context, dynamic args);

  ShapeBorder? get shape => null;

  bool get isScrollControlled => false;

  ControllerInterface get controller => Get.find<ControllerInterface>(tag: tag);

  Store get store => Get.find<Store>(tag: tag);

  final String? tag = null;

  void close<T>({
    T? result,
  }) {
    Get.back(result: result);
  }

  Future<T?> showBottomSheet<T>([dynamic args]) {
    return showModalBottomSheet<T>(
      context: Get.context!,
      builder: (context) => buildView(context, args),
      shape: shape,
      isScrollControlled: isScrollControlled,
    );
  }
}
