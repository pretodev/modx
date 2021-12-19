import 'package:flutter/material.dart';
import 'package:modx/modx.dart';

import 'login_store.dart';
import 'login_controller.dart';

class LoginView extends StatefulView<LoginController, LoginStore> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(),
    );
  }
}