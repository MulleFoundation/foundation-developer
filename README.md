# foundation-developer

#### 👒 Objective C with mulle-sde and the MulleFoundation

**foundation-developer** is a collection of *mulle-sde extensions* to support 
development with the [MulleFoundation](//github.com/MulleFoundation) and
the [Apple Foundation](https://developer.apple.com/documentation/foundation?language=objc).

As a package for **homebrew** (OS X) and **apt** (Linux) it is also the most
convenient way to install [mulle-sde](//github.com/mulle-sde/mulle-sde).

*foundation-developer* provides `<Foundation/Foundation.h>` to your mulle-sde
projects. It is a thin package atop of
[mulle-foundation-developer](//github.com/MulleFoundation/mulle-foundation-developer).


Project      | Build Status
-------------|-----------------------------------
![Logo](https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/logo.png)| ![Mulle kybernetiK tag](https://img.shields.io/github/tag/MulleFoundation/foundation-developer.svg) [![Build Status](https://github.com/MulleFoundation/foundation-developer/workflows/CI/badge.svg?branch=release)](//github.com/MulleFoundation/foundation-developer/actions)


See [De Re MulleObjc](//github.com/mulle-objc/De-Re-MulleObjC) for an introduction
to *mulle-objc*.

See [mulle-sde Wiki](//github.com/mulle-sde/mulle-sde/wiki) for an introduction
to *mulle-sde*.

For further information to get you up and running, see the [mulle-objc Community](//mulle-objc.github.io).


Extension                 | Type | Description
--------------------------|------|----------------------------
foundation/objc-developer | meta | Create Objective-C projects

### Table of Contents

- [Usage](#Usage)
- [Install](#Install)
- - [Packages](#Packages)
- - [Script](#Script)
- - [Docker](#Docker)
- [Relations](#Relations)

# Install

The initial install will only add *mulle-sde* to your system. The
MulleFoundation itself will be fetched by *mulle-sde*, if needed, when you
craft your project for the first time.
(see **Usage** above).

There is a variety of installation methods:

* **Docker**
* **Packages**
* **Script**

## Docker

Docker images are published to [dockerhub](https://hub.docker.com/r/mulleobjc/foundation).

Pull an image with:

```sh
sudo docker pull mulleobjc/foundation
```

Run it with:

``` sh
sudo docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -i -t mulleobjc/foundation:latest
```


You can also build the docker image with the [Dockerfile](https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile):

``` sh
sudo docker build -t foundation 'https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile'
sudo docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -i -t foundation
```



## Packages

OS      | Package manager | Command
--------|-----------------|-----------------------------------
macos   | homebrew        | `brew install mulle-kybernetik/software/foundation-developer`
debian  | apt             | `sudo apt-get -y install foundation-developer` (but see below)
ubuntu  | apt             | `sudo apt-get -y install foundation-developer` (but see below)



### homebrew - One line install


``` sh
brew install mulle-kybernetik/software/foundation-developer
```


### apt - Remote script install

You can use this one-liner to do install everything:

``` sh
wget -qO - https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/bin/apt-installer \
| sudo sh
```


### apt - Manual install

#### Install Prerequisites

As prerequisites there are some very basic packages that need to be installed
first. They are usually present on any but a barebones system.

Package               | Comment
----------------------|--------------------------
`wget` or `curl`      | to fetch stuff
`gnupg`               | *apt-key* may require it
`lsb-release`         | For the repository source list
`apt-transport-https` | To let *apt-get* fetch via https
`sudo`                | Or run everything as root
`libncurses5`         | Debian only (?)

```
apt-get install apt-transport-https gnupg lsb-release sudo wget
```

From here on it's assumed, that sudo is installed. If you don't have *sudo*,
edit out the *sudo* from the command lines and run everything as `root`


#### Install the GPG keys:

Or you can do the instfirst add the necessary key to *apt*:

``` sh
wget -qO - "https://www.mulle-kybernetik.com/dists/debian-admin-pub.asc" \
| sudo apt-key add -
```

#### Add the *apt* repository source list:

``` sh
echo "deb [arch=all] http://www.mulle-kybernetik.com `lsb_release -c -s` main" \
| sudo tee "/etc/apt/sources.list.d/mulle-kybernetik.com-main.list" > /dev/null
```

Now you are ready to install *foundation-developer*:

``` sh
sudo apt-get update
sudo apt-get install foundation-developer
```

#### Download and install the mulle-clang compiler

Check the [compiler releases](//github.com/mulle-cc/mulle-clang-project/releases)
for the proper version to download:

``` sh
curl -L -O "https://github.com/mulle-cc/mulle-clang-project/releases/download/14.0.6.2/mulle-clang-14.0.6.2-bullseye-amd64.deb"
sudo dpkg --install "mulle-clang-14.0.6.2-bullseye-amd64.deb"
```

#### Download and install the mulle-gdb debugger

Check the [debugger releases](//github.com/mulle-cc/mulle-gdb/releases)
for the proper version to download:

``` sh
curl -L -O "https://github.com/mulle-cc/mulle-gdb/releases/download/11.1.0.0/mulle-gdb_11.1.0-1_bullseye_amd64.deb"
sudo dpkg --install "mulle-gdb_11.1.0-1_bullseye_amd64.deb"
```

### Docker

There is a [Dockerfile](https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile) in the project. To build and run an ephemeral development container named `foundation` based on ubuntu, do:

``` sh
sudo docker build -t foundation 'https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile'
sudo docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -i -t --rm foundation
```


### Script

*mulle-sde* provides an
[installer-all](https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all).

This is suitable for environments without supported package managers like for
instance *Fedora* or *FreeBSD*.

Prerequisites         | Comment
----------------------|--------------------------
`build-essential`     | The usual compiler tools like cc, ar, nm
`curl`                | To fetch stuff, or substitute with wget
`cmake`               | Shoot for cmake 3.1 or higher
`sudo`                | Or run everything as root
`uuid-runtime`        | `uuidgen` is needed by mulle-sde
`bsdmainutils`        | Needed for `column`. A dependency that should go away...
`less`                | Should be optional, but isn't right now



#### Install into /usr/local with sudo

``` sh
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all' && \
chmod 755 installer-all && \
sudo OTHER_PROJECTS="MulleFoundation/foundation-developer;latest \
MulleFoundation/mulle-foundation-developer;latest \
mulle-objc/mulle-objc-developer;latest \
mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest \
mulle-test;latest" \
./installer-all /usr/local
```

#### Install into ${HOME} (without sudo)

``` sh
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all' && \
chmod 755 installer-all && \
OTHER_PROJECTS="MulleFoundation/foundation-developer;latest \
MulleFoundation/mulle-foundation-developer;latest \
mulle-objc/mulle-objc-developer;latest \
mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest \
mulle-test;latest" \
./installer-all ~ no
```

You need to install the compiler [mulle-clang](//github.com/mulle-cc/mulle-clang-project)
and the debugger [mulle-gdb](//github.com/mulle-cc/mulle-gdb) separately.


# Usage

The following examples show how to use the *MulleFoundation* with the
*mulle-sde* environment. If you prefer `Makefiles` or some such, read about
the [legacy workflow](https://mulle-objc.github.io/De-Re-mulle-objc/mydoc_legacy.html).


## Check that the (meta) extensions are found:

``` sh
mulle-sde extension show
```

## Create an Objective-C executable project

This kind of project works with the Apple Foundation on macOS and with the
MulleFoundation everywhere else:

``` sh
mkdir foo
cd foo
mulle-sde init -m foundation/objc-xcode-developer executable
```

Then just follow the instructions *mulle-sde* prints.

> #### Tips
>
> If you want to use the MulleFoundation on macOS as well, choose
> the meta extension `foundation/objc-developer` instead.
>
> There may appear an error because of a missing MulleObjCDecimalLibrary. This
> is normal and harmless.
>


## Relations

![package relationships](dox/relationships.png)
