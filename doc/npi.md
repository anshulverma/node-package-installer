npi(1) -- node package installer
=====================================

## SYNOPSIS

    npi { -v | -h } install [-n | --name <name>             ]
                            [-i | --id <package-version-id> ]
                            [-c | --config <config-path>    ]
                            [-a | --artifact <artifact-id>  ]
                            [-u | --url <url>               ]
                            [-d | --dest <destination-dir>  ]
                            [-t | --type <package-type>     ]

## VERSION

@VERSION@

## DESCRIPTION

npi is a command line utility to easily installed bundled packages
from a remote location.

The package installation type is configurable. The package type determines
how a bundle must be installed.

## INTRODUCTION

You probably got `npi` because you are tired of running the same commands
over and over to do one thing: install a package. `npi` is here to help
solve this problem by letting you write a simple script or json to describe
what you'd like to install and how you'd like to install it.

Execute `npi install` and follow the direction in the prompt for an
interactive way of installing your software.

## CONFIGURATION

--TODO--

## CONTRIBUTIONS

There will always be a need for adding support for new languages,
package managers or repository.

When you do make an edit, please make sure to keep documentation in sync
with your edits. Tests are also required to validate your changes.

Contributors are listed in npm's `package.json` file.  You can view them
easily by doing `npm view npi contributors`.

If you would like to contribute, but don't know what to work on, check
the issues list or ask on the mailing list.

* <https://github.com/anshulverma/node-package-installer/issues>
* <node-package-installer@googlegroups.com>

## BUGS

When you find issues, please report them:

* web:
  <https://github.com/anshulverma/node-package-installer/issues>
* email:
  <node-package-installer@googlegroups.com>>

Be sure to include *all* of the output from the `npi` command that didn't work
as expected.  The `npm-debug.log` file is also helpful to provide.

## AUTHOR

[Anshul Verma](http://anshulverma.github.io/) ::
[anshulverma](https://github.com/anshulverma) ::
[@anshulverma](http://twitter.com/anshulverma)


