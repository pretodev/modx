import * as changeCase from "change-case";

export function widgetModuleTemplate(name: string) {
  const widgetName = `${name}Widget`;
  const viewName = `${name}View`;
  const controllerName = `${name}Controller`;
  const storeName = `${name}Store`;

  const storePath = changeCase.snakeCase(storeName);
  const controllerPath = changeCase.snakeCase(controllerName);
  const viewPath = changeCase.snakeCase(viewName);

  return `import 'package:modulex/modulex.dart';
import 'package:flutter/material.dart';

import '${storePath}.dart';
import '${controllerPath}.dart';
import '${viewPath}.dart';

class ${widgetName} extends WidgetModule {

  const ${widgetName}({Key? key}) : super(key: key);

  @override
  final view = const ${viewName}();

  @override
  void dependencies(i) {
    // Add others dependencies
    bind(${storeName}());
    bind(${controllerName}());
  }
}
  `.trim();
}