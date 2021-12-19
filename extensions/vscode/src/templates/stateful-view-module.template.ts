import * as changeCase from "change-case";

export function statefulViewModuleTemplate(name:string) {
  const viewName = `${name}View`;
  const controllerName = `${name}Controller`;
  const storeName = `${name}Store`;

  const storePath = changeCase.snakeCase(storeName);
  const controllerPath = changeCase.snakeCase(controllerName);

  const title = changeCase.sentenceCase(name);

  return `import 'package:flutter/material.dart';
import 'package:modx/modx.dart';

import '${storePath}.dart';
import '${controllerPath}.dart';

class ${viewName} extends StatefulView<${controllerName}, ${storeName}> {
  const ${viewName}({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${title}'),
      ),
      body: Container(),
    );
  }
}
  `.trim();
}