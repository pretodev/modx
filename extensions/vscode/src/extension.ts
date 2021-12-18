import * as vscode from 'vscode';
import { newPageModule } from './commands';

export function activate(context: vscode.ExtensionContext) {
  context.subscriptions.push(
    vscode.commands.registerCommand('extensions.new-page-module', newPageModule)
  );
}

