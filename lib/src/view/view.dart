import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:modulex/src/view/controller.dart';

abstract class StatelessView<ControllerInterface extends Controller>
    extends StatelessWidget {
  final String? tag = null;

  const StatelessView({Key? key}) : super(key: key);

  ControllerInterface get controller => GetInstance().find(tag: tag)!;
}

abstract class StatefulView<ControllerInterface extends Controller,
    Store extends Object> extends StatelessView<ControllerInterface> {
  const StatefulView({Key? key}) : super(key: key);

  Store get store => Get.find<Store>(tag: tag);
}
