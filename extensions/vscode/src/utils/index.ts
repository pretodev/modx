import { existsSync, writeFile } from "fs";
import mkdirp = require("mkdirp");
import { InputBoxOptions, OpenDialogOptions, window } from "vscode";
import * as _ from 'lodash';

export function promptForModuleName(): Thenable<string | undefined> {
  const moduleNamePromptOptions: InputBoxOptions = {
    prompt: "PageModule name",
    placeHolder: "Home, Details",
  };
  return window.showInputBox(moduleNamePromptOptions);
}

export async function promptForTargetDirectory(): Promise<string | undefined> {
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

export async function createDirectory(targetDirectory: string) {
  return mkdirp(targetDirectory);
}

export async function createFile(path: string, template: string) {
  if (existsSync(path)) {
    throw Error(`${path} already exists`);
  }
  return new Promise((resolve, reject) => {
    writeFile(path, template, "utf-8", error => error ? reject(error) : resolve(true));
  });
}