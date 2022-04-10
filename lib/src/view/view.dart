import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'controller.dart';

abstract class StatelessView<ControllerInterface extends ModxController>
    extends StatelessWidget {
  final String? tag = null;

  const StatelessView({Key? key}) : super(key: key);

  ControllerInterface get controller => Get.find<ControllerInterface>(tag: tag);
}

abstract class ModxView<ControllerInterface extends ModxController,
    Store extends Object> extends StatelessView<ControllerInterface> {
  const ModxView({Key? key}) : super(key: key);

  Store get store => Get.find<Store>(tag: tag);
}
