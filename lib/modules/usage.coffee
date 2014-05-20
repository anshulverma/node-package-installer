colors = require 'colors'

module.exports = [
  '   __      __  ___ '.cyan,
  '  |  | |  |__|  |  '.cyan,
  '  |  |_|  |    _|_ '.cyan,
  '',

  'Package installer utility',
  'https://github.com/anshulverma/node-package-installer',
  '',

  'Usage:'.cyan.bold.underline,
  '',
  '  npi { -v | -h } install [-n | --name <name>             ]',
  '                          [-i | --id <package-version-id> ]',
  '                          [-c | --config <config-path>    ]',
  '                          [-a | --artifact <artifact-id>  ]',
  '                          [-u | --url <url>               ]',
  '                          [-d | --dest <destination-dir>  ]',
  '',

  'Available Commands:'.cyan.bold.underline,
  'install',
  ''

  'To install a package'.cyan,
  '  npi install --name=my-package --id=1.0.0 --url="http://www.repo.com/packages" --dest=/usr/lib',
  'or use artifactID'.cyan,
  '  npi install --artifact=my-package-1.0.0 --url="http://www.repo.com/packages" --dest=/usr/lib',
  'or you can use a preconfigured json with proper installation details ("man npi" for details)'.cyan,
  '  npi install --config=./my-installation-config.json',
  ''
];
