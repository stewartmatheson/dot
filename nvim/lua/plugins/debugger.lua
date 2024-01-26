local ruby = function()
  local dap = require('dap')

  dap.adapters.ruby = function(callback, config)
    callback {
      type = "server",
      host = "127.0.0.1",
      port = "${port}",
      executable = {
        command = "bundle",
        args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
          "-c", "--", "bundle", "exec", config.command, config.script,
        },
      },
    }
  end

  dap.configurations.ruby = {
    {
      type = "ruby",
      name = "debug current file",
      request = "attach",
      localfs = true,
      command = "ruby",
      script = "${file}",
    },
    {
      type = "ruby",
      name = "run current spec file",
      request = "attach",
      localfs = true,
      command = "rake",
      script = "test",
    },
  }
end

local c_and_cpp = function()
  local dap = require('dap')
  dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
  }

  local c_and_cpp_configuration = {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
  }

  dap.configurations.c = {
    c_and_cpp_configuration
  }

  dap.configurations.cpp = {
    c_and_cpp_configuration
  }
end

return {
  dir = "~/code/open-source/nvim-dap",
  config = function()
    local actions = {
      start = {
        function() require('dap').continue() end,
        'Start'
      },
      step_over = {
        function() require('dap').step_over() end,
        'Step Over'
      },
      step_into = {
        function() require('dap').step_init() end,
        'Step Into'
      },
      step_out = {
        function() require('dap').step_out() end,
        'Step Out'
      },
      set_breakpoint = {
        function() require('dap').set_breakpoint() end,
        'Set Breakpoint'
      },
      toggle_breakpoint = {
        function() require('dap').toggle_breakpoint() end,
        'Toggle Breakpoint'
      },
      repl_open = {
        function() require('dap').repl.open() end,
        'Open Repl'
      },
      run_last = {
        function() require('dap').run_last() end,
        'Run Last'
      },
      widgets = {
        hover = {
          function() require('dap.ui.widgets').hover() end,
          'Hover'
        },
        preview = {
          function() require('dap.ui.widgets').preview() end,
          'Preview'
        },
        frames = {
          function() require('dap.ui.widgets').frames() end,
          'Frames'
        },
        scopes = {
          function() require('dap.ui.widgets').scopes() end,
          'Scopes'
        }
      }
    }

    local wk = require('which-key')
    wk.register({
      ["<leader>"] = {
        d = {
          name = "Debug",
          s = actions.start,
          o = actions.step_over,
          b = actions.set_breakpoint,
          t = actions.toggle_breakpoint,
          r = actions.repl_open,
          l = actions.run_last,
          h = actions.widgets.hover,
          p = actions.widgets.preview,
          f = actions.widgets.frames,
          c = actions.widgets.scopes,
        }
      },

      ["<F5>"] = actions.start,
      ["<F10>"] = actions.step_over,
      ["<F11>"] = actions.step_into,
      ["<F12>"] = actions.step_out,
    })

    --c_and_cpp()
    ruby()
  end
}
