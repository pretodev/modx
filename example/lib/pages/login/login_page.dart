import 'package:modx/modx.dart';

import 'login_store.dart';
import 'login_controller.dart';
import 'login_view.dart';

class LoginPage extends ModxPage {
  @override
  // TODO: define the route
  final route = throw UnimplementedError();

  @override
  final view = const LoginView();

  @override
  void binding(i) {
    // Add others dependencies
    bind(LoginStore());
    bind(LoginController());
  }
}
