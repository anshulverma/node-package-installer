if process.platform is 'win32' then return

complete = require 'complete'
output   = complete.output;

complete({
  program: 'npi'
  options:
    '--help': {},
    '-h': {},
    '--version': {},
    '-v': {}
})
