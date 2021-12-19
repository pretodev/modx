import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'module.dart';

abstract class WidgetModule<AppStore extends Object> extends StatelessWidget
    with Module<AppStore> {
  const WidgetModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BindContextProvider(
      onInit: () => binding(Get.find),
      child: view,
    );
  }
}

class _BindContextProvider extends StatefulWidget {
  final Widget child;
  final VoidCallback onInit;

  const _BindContextProvider({
    Key? key,
    required this.child,
    required this.onInit,
  }) : super(key: key);

  @override
  State<_BindContextProvider> createState() => _BindContextProviderState();
}

class _BindContextProviderState extends State<_BindContextProvider> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
