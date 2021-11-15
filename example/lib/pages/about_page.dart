import 'package:flutter/material.dart';
import 'package:modulex/modulex.dart';

class AboutPage extends PageModule {
  @override
  String get route => '/about';

  @override
  Widget get view => const AboutView();
}

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Center(
        child: Text('Informarcoes sobre o app.'),
      ),
    );
  }
}
