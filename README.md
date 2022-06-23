## goupdater
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)

<img src="https://raw.githubusercontent.com/TLINDEN/goupdater/main/rage.png" width="100">

install and update go binaries released on github

## About
This tool can be used to maintain manually installed binary GO
tools installed via github releases, just like a package manager.

Sample output:
```
% goupdater list
Tool      Installed-Release             Latest-Release
fzf       0.30.0                        0.30.0
helm      v3.9.0                        v3.9.0
hub       v2.14.2                       v2.14.2
kind      v0.14.0                       v0.14.0
mc        RELEASE.2022-06-17T02-52-50Z  RELEASE.2022-06-17T02-52-50Z
stern     v1.21.0                       v1.21.0
yq        v4.25.2                       v4.25.2
```


## Usage
```
Usage: goupdater <command> [param]

Commands:
  list                   lists all installed GO binaries.
  install <uri> [<tool>] installs the specified tool using the github uri
  update [<tool>]        updates all tools or only the one specified.
  help                   shows this message.
  version                shows the version of goupdater.
```

### Examples

- Install a new tool:
  `goupdater install hub https://github.com/github/hub`

- Update a specific tool:
  `goupdater update hub`

- Update all tools (if there are updates available!)
  `goupdater update`

- List all installed releases:
  `goupdater list`

### Configuration File

The config will be stored in `~/.goupdaterrc`. It will be automatically
generated upon first start.

Format of the file:

The variable `sources` is an associative array, the key
is the tool itself, the value is a semicolon separated
list containing the folliwing values:
- github project owner
- github project name
- optional: download uri (the release tag will be appended)

You might also add github auth variables:
- user: holds the github username
- token: holds the token ([generate it on your github account](https://github.com/settings/tokens))

However, the tool will also work without authentication but
then only 60 requests per hour can be made to github.

Sample configuration file:
```
user="*******"
token="*********"

declare -A sources=(
    [stern]="stern;stern"
    [mc]="minio;mc;https://dl.min.io/client/mc/release/linux-amd64/mc."
    [fzf]="junegunn;fzf"
    [cloudctl]="fi-ts;cloudctl"
    [kind]="kubernetes-sigs;kind"
    [yq]="mikefarah;yq"
    [helm]="helm;helm"
    [hub]="github;hub"
)
```

### Completion

To enable completion for the script, put this line into your `~/.bashrc`:

`source <(goupdater completion bash)`

Other shells are currently not supported.

## Getting help

Although I'm happy to hear from udpxd users in private email, that's the best way for me to forget to do something.

In order to report a bug, unexpected behavior, feature requests or to submit a patch, please open an [issue on github](https://github.com/TLINDEN/goupdater/issues). Thank you!

Pull requests are much appreciated!

## Copyright and license

goupdater is licensed under the GPL version 3.0

Copyleft (c) T.v.Dein

## Authors

[T.v.Dein](https://github.com/TLINDEN/)
