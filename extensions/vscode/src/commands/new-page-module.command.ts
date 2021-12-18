import { InputBoxOptions, OpenDialogOptions, Uri, window } from "vscode";
import * as _ from 'lodash';
import { existsSync, lstatSync, writeFile } from "fs";
import * as changeCase from "change-case";
import * as mkdirp from "mkdirp";
import { controllerModuleTemplate, pageModuleTemplate, statefulViewModuleTemplate, storeModuleTemplate } from "../templates";

export async function newPageModule(uri: Uri) {
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
    await generateModuleCode(moduleName, targetDirectory);
    window.showInformationMessage(
      `Successfully Generated ${moduleName}`
    );
  } catch (error) {
    window.showErrorMessage(
      `Error:
        ${error instanceof Error ? error.message : JSON.stringify(error)}`
    );
  }
}

async function generateModuleCode(
  name: string,
  targetDirectory: string,
) {
  
  const pascalName = changeCase.pascalCase(name.toUpperCase());
  const snakeName = changeCase.snakeCase(name.toLocaleLowerCase());
  const directoryPath = `${targetDirectory}/${snakeName}`;
  if (!existsSync(directoryPath)) {
    await createDirectory(directoryPath);
  }
  await Promise.all([
    createFile(`${directoryPath}/${snakeName}_store.dart`, storeModuleTemplate(pascalName)),
    createFile(`${directoryPath}/${snakeName}_controller.dart`, controllerModuleTemplate(pascalName)),
    createFile(`${directoryPath}/${snakeName}_view.dart`, statefulViewModuleTemplate(pascalName)),
    createFile(`${directoryPath}/${snakeName}_page.dart`, pageModuleTemplate(pascalName)),
  ]);
}

function promptForModuleName(): Thenable<string | undefined> {
  const moduleNamePromptOptions: InputBoxOptions = {
    prompt: "PageModule name",
    placeHolder: "Home, Details",
  };
  return window.showInputBox(moduleNamePromptOptions);
}

async function promptForTargetDirectory(): Promise<string | undefined> {
  const options: OpenDialogOptions = {
    canSelectMany: false,
    openLabel: "Select a folder to create the module in",
    canSelectFolders: true,
  };

  return window.showOpenDialog(options).then((uri) => {
    if (_.isNil(uri) || _.isEmpty(uri)) {
      return undefined;
    }
    return uri[0].fsPath;
  });
}

async function createDirectory(targetDirectory: string) {
  return mkdirp(targetDirectory);
}

async function createFile(path: string, template: string) {
  if (existsSync(path)) {
    throw Error(`${path} already exists`);
  }
  return new Promise((resolve, reject) => {
    writeFile(path, template, "utf-8", error => error ? reject(error) : resolve(true));
  });
}