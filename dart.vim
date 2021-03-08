lua << EOF
	local dap = require('dap')
	dap.adapters.dart = {
		type = "executable",
		command = "node",
		args = {"~/.config/nvim/dart-debugger/Dart-Code/out/dist/debug.js", "flutter"}
  	}
	dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch flutter",
      dartSdkPath = os.getenv('HOME').."/development/flutter/bin/cache/dart-sdk/",
      flutterSdkPath = os.getenv('HOME').."/development/flutter",
      program = "${workspaceFolder}/lib/main_dev.dart",
      cwd = "${workspaceFolder}",
    }
  }
EOF

" set breakpoint :lua require'dap'.toggle_breakpoint().
" launch debug sessions and resuming execution  :lua require'dap'.continue().
" Stepping through code :lua require'dap'.step_over() and :lua require'dap'.step_into().
" Inspecting the state via the built-in REPL: :lua require'dap'.repl.open()
"
command! SetBP :lua require'dap'.toggle_breakpoint()
command! NextBP :lua require'dap'.continue()
command! Inspect :lua require'dap'.repl.open()
