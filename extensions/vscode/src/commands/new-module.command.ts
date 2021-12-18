import { Uri, window } from "vscode";
import * as _ from 'lodash';
import { existsSync, lstatSync, writeFile } from "fs";
import * as changeCase from "change-case";
import { controllerModuleTemplate, pageModuleTemplate, statefulViewModuleTemplate, storeModuleTemplate } from "../templates";
import { createDirectory, createFile, promptForModuleName, promptForTargetDirectory } from "../utils";
import { widgetModuleTemplate } from "../templates/widget-module.template";

export const enum ModuleType {
  widget,
  page,
}

export function newModule(type: ModuleType) {
  return async (uri: Uri) => {
    const moduleName = await promptForModuleName();
    if (_.isNil(moduleName) || moduleName.trim() === "") {
      window.showErrorMessage("The PageModule must not be empty");
      return;
    }

    let targetDirectory;
    if (_.isNil(_.get(uri, "fsPath")) || !lstatSync(uri.fsPath).isDirectory()) {
      targetDirectory = await promptForTargetDirectory();
      if (_.isNil(targetDirectory)) {
        window.showErrorMessage("Please select a valid directory");
        return;
      }
    } else {
      targetDirectory = uri.fsPath;
    }
    try {
      await generateModuleCode(moduleName, targetDirectory, type);
      window.showInformationMessage(
        `Successfully Generated ${moduleName}`
      );
    } catch (error) {
      window.showErrorMessage(
        `Error:
        ${error instanceof Error ? error.message : JSON.stringify(error)}`
      );
    }
  };
}

async function generateModuleCode(
  name: string,
  targetDirectory: string,
  type: ModuleType,
) {

  const pascalName = changeCase.pascalCase(name.toUpperCase());
  const snakeName = changeCase.snakeCase(name.toLocaleLowerCase());
  const directoryPath = `${targetDirectory}/${snakeName}`;
  if (!existsSync(directoryPath)) {
    await createDirectory(directoryPath);
  }
  const files = [
    createFile(`${directoryPath}/${snakeName}_store.dart`, storeModuleTemplate(pascalName)),
    createFile(`${directoryPath}/${snakeName}_controller.dart`, controllerModuleTemplate(pascalName)),
    createFile(`${directoryPath}/${snakeName}_view.dart`, statefulViewModuleTemplate(pascalName)),
  ];
  if(type === ModuleType.page) {
    files.push(createFile(`${directoryPath}/${snakeName}_page.dart`, pageModuleTemplate(pascalName)));
  } else {
    files.push(createFile(`${directoryPath}/${snakeName}_widget.dart`, widgetModuleTemplate(pascalName)));
  }
  await Promise.all(files);
}

