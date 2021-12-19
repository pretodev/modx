import 'package:modx/modx.dart';

import 'register_store.dart';
import 'register_controller.dart';
import 'register_view.dart';

class RegisterPage extends PageModule {
  @override
  // TODO: define the route
  final route = throw UnimplementedError();

  @override
  final view = const RegisterView();

  @override
  void binding(i) {
    // Add others binding
    bind(RegisterStore());
    bind(RegisterController());
  }
}