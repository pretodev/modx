import 'package:flutter/material.dart';
import 'package:modx/modx.dart';

import 'register_store.dart';
import 'register_controller.dart';

class RegisterView extends StatefulView<RegisterController, RegisterStore> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(),
    );
  }
}