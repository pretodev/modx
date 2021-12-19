import * as changeCase from "change-case";

export function pageModuleTemplate(name: string) {
  const pageName = `${name}Page`;
  const viewName = `${name}View`;
  const controllerName = `${name}Controller`;
  const storeName = `${name}Store`;

  const storePath = changeCase.snakeCase(storeName);
  const controllerPath = changeCase.snakeCase(controllerName);
  const viewPath = changeCase.snakeCase(viewName);

  return `import 'package:modx/modx.dart';

import '${storePath}.dart';
import '${controllerPath}.dart';
import '${viewPath}.dart';

class ${pageName} extends PageModule {
  @override
  \/\/ TODO: define the route
  final route = throw UnimplementedError();

  @override
  final view = const ${viewName}();

  @override
  void binding(i) {
    // Add others binding
    bind(${storeName}());
    bind(${controllerName}());
  }
}
  `.trim();
}