#!/usr/bin/env gjs
const Workspace = global.workspace_manager.get_active_workspace();
log("Talkei talkei. Airgo vah nah goo trim brader.");
const windows = Workspace.list_windows();
let naof_windows = windows.length;
let site = 0;

