import * as vscode from 'vscode';
import { ModuleType, newModule } from './commands';

export function activate(context: vscode.ExtensionContext) {
  context.subscriptions.push(
    vscode.commands.registerCommand('extensions.new-page-module', newModule(ModuleType.page)),
    vscode.commands.registerCommand('extensions.new-widget-module', newModule(ModuleType.widget)),
  );
}

