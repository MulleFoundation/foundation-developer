# 👒 Objective C with mulle-sde and the MulleFoundation


**foundation-developer** is a collection of *mulle-sde extensions* to support development
with the [MulleFoundation](//github.com/MulleFoundation)
code. As a package for **homebrew** (OS X) and **apt** (Linux) it is also the most
convenient way to install [mulle-sde](//github.com/mulle-sde/mulle-sde) and
[mulle-clang](//github.com/Codeon-GmbH/mulle-clang).


Project      | Build Status
-------------|-----------------------------------
![Logo](https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/logo.png)| ![Mulle kybernetiK tag](https://img.shields.io/github/tag/MulleFoundation/foundation-developer.svg) [![Build Status](https://travis-ci.org/MulleFoundation/foundation-developer.svg?branch=release)](https://travis-ci.org/MulleFoundation/foundation-developer)


*foundation-developer* enables the use of `<Foundation/Foundation.h>` in your
projects. It is very thin package atop of
[mulle-foundation-developer](//github.com/MulleFoundation/mulle-foundation-developer).

See *Usage* below for a quick introduction to get you up and running. For further
information, use the [mulle-objc Community](//mulle-objc.github.io)
page as the starting point on the *MulleFoundation* and *mulle-objc* in general.
See [mulle-sde Wiki](//github.com/mulle-sde/mulle-sde/wiki) for an introduction
to *mulle-sde*.


Extension                 | Type | Description
--------------------------|------|----------------------------
foundation/objc-developer | meta | Create Objective-C projects


# Install

On a clean Linux system, the install with all dependencies (like
build-essentials and libraries) will need about 2 GB of free space.
The mulle-objc part of this will be ca. 0.7GB.

> See [Legacy Workflow](//github.com/MulleFoundation/foundation-developer/blob/release/dox/legacy-workflow.md)
> if you want to build the *MulleFoundation* library outside of *mulle-sde* projects.


The initial install will only add *mulle-sde* and *mulle-clang* to your
system. The Foundation itself will be fetched by *mulle-sde*, when you create
a new project (see **Usage** below).

There is a variety of installation methods:

* **Packages**
* **Docker**
* **Script**


## Packages

OS      | Package manager | Command
--------|-----------------|-----------------------------------
macos   | homebrew        | `brew install mulle-kybernetik/software/foundation-developer`
debian  | apt             | `sudo apt-get -y install foundation-developer` (but see below)
ubuntu  | apt             | `sudo apt-get -y install foundation-developer` (but see below)


### apt

As prerequisites there are some very basic packages that need to be installed
first. They are usually present on anything but a barebones system.


#### Prerequisites

Package               | Comment
----------------------|--------------------------
`wget` or `curl`      | to fetch stuff
`gnupg`               | *apt-key* may require it
`lsb-release`         | For the repository source list
`apt-transport-https` | To let *apt-get* fetch via https
`sudo`                | Or run everything as root


```
apt-get install apt-transport-https gnupg lsb-release sudo wget
```

From here on it's assumed, that sudo is installed. If you don't have *sudo*,
edit out the *sudo* from the command lines and run everything as `root`


#### One line install

You can use this one-liner to do all the following steps in one:

```
wget -qO - https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/bin/apt-installer | sudo sh
```


#### Install the GPG keys:

Otherwise first add the necessary key to *apt*:

```
wget -qO - "https://www.codeon.de/dists/codeon-pub.asc" | sudo apt-key add -
wget -qO - "https://www.mulle-kybernetik.com/dists/debian-admin-pub.asc" | sudo apt-key add -
```

#### Add the *apt* repository source list:

```
echo "deb [arch=amd64] http://download.codeon.de `lsb_release -c -s` main" | sudo tee /etc/apt/sources.list.d/codeon.de-main.list > /dev/null
echo "deb [arch=all] http://www.mulle-kybernetik.com `lsb_release -c -s` main" | sudo tee "/etc/apt/sources.list.d/mulle-kybernetik.com-main.list" > /dev/null
```

Now you are ready to install *foundation-developer*:

```
sudo apt-get update
sudo apt-get install foundation-developer
```


### Docker

There is a [Dockerfile](https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile) in the project. To build and run an ephemeral container named
`foundation` based on ubuntu, do:

```
sudo docker build -t foundation 'https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile'
sudo docker run -i -t --rm foundation
```

### Script

*mulle-sde* provides an
[installer-all](https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all)
script to install *foundation-developer* into `/usr` (or some other place).
This is suitable for environments without supported package managers like for
instance *Fedora* or *FreeBSD*.


#### Install into /usr with sudo

```
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all' && \
chmod 755 installer-all && \
sudo OTHER_PROJECTS="MulleFoundation/foundation-developer;latest \
MulleFoundation/mulle-foundation-developer;latest \
mulle-objc/mulle-objc-developer;latest \
mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest" ./installer-all /usr
```

#### Install into ${HOME} (without sudo)

```
curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all' && \
chmod 755 installer-all && \
OTHER_PROJECTS="MulleFoundation/foundation-developer;latest \
MulleFoundation/mulle-foundation-developer;latest \
mulle-objc/mulle-objc-developer;latest \
mulle-c/mulle-c-developer;latest" \
SDE_PROJECTS="mulle-sde-developer;latest" ./installer-all ~
```

You will need to install [mulle-clang](//github.com/Codeon-GmbH/mulle-clang)
yourself though.


# Usage

The following examples show how to use the *MulleFoundation* with the
*mulle-sde* environment. There are instructions available to support a
[legacy workflow](dox/legacy-workflow.md) for compilation via `Makefile` or
some such.


### Check that the (meta) extensions are found:

```
mulle-sde extension show
```

### Create an Objective-C executable project

```
mkdir foo
cd foo
mulle-sde init -m foundation/objc-developer executable
```

Just follow the instructions *mulle-sde* prints.

> There will be an error because of a missing MulleObjCDecimalLibrary. This
> is normal.


### Create an Objective-C library project

```
mulle-sde init -d foolib -m foundation/objc-developer library
cd foolib
mulle-sde craft
```


### Don't create a project but get ObjC libraries built

```
mulle-sde init -m foundation/objc-developer none
mulle-sde craft
```

## How to write Objective-C

This is a list of resources useful when starting to write Objective-C.

### Learn Objective-C, Tutorialspoint

[Objective-C Quick Guide](https://www.tutorialspoint.com/objective_c/objective_c_quick_guide.htm) looks like
a good tutorial start, Iignore the parts about "gcc", "MacOSX", "GNUStep" though. They also have a much larger tutorial, 
where you should ignore "Blocks", "Posing", and anything mentioning "ARC".


### Programming with Objective-C, by Apple

[Programming With Objective C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) covers all the basics. Ignore the chapter about "Blocks", everything else should be fine.

### Concepts in Objective-C Programming, by Apple

[Concepts in Objective-C Programming](https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Introduction/Introduction.html) is more in-depth and is a good read to understand some terminology used by fellow Objective-C coders. Ignore the chapters "Delegates and Data Sources", "Model View Controller", "Object Modeling", "Outlets", "Receptionist Pattern", "Target-Action", "Toll-Free Bridging"

### Learn Objective-C, CocoaDev

[Learn Objective-C](https://www.cocoadevcentral.com/d/learn_objectivec) gives a quick overview of concepts. Ignore the part about "Dot Syntax" though.

### Learn-C.org

An interactive tutorial site to learn the basics of C is
[learn-c.org free interactive C tutorial](https://www.learn-c.org)


## Relations

![package relationships](dox/relationships.png)
