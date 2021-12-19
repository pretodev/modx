import * as changeCase from "change-case";

export function controllerModuleTemplate(name: string) {
  const controllerName = `${name}Controller`;
  const storeName = `${name}Store`;

  const storePath = changeCase.snakeCase(storeName);

  return `import 'package:modx/modx.dart';

import '${storePath}.dart';

class ${controllerName} extends Controller<${storeName}> {

}
  `.trim();

}