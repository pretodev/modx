import * as changeCase from "change-case";

export function pageModuleTemplate(name: string) {
  const pageName = `${name}Page`;
  const viewName = `${name}View`;
  const controllerName = `${name}Controller`;
  const storeName = `${name}Store`;

  const storePath = changeCase.snakeCase(storeName);
  const controllerPath = changeCase.snakeCase(controllerName);
  const viewPath = changeCase.snakeCase(viewName);

  return `import 'package:modulex/modulex.dart';

import '${storePath}.dart';
import '${controllerPath}.dart';
import '${viewPath}.dart';

class ${pageName} extends PageModule {
  @override
  \/\/TODO: Change the page route 
  final route = '';

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