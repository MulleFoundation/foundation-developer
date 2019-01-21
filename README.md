# 👒 Objective C with mulle-sde and the MulleFoundation


**foundation-developer** is a collection of [mulle-sde](//github.com/mulle-sde/mulle-sde)
*extensions* to support development of [MulleFoundation](//github.com/MulleFoundation)
code. As a package for **homebrew** (OS X) and **apt** (Linux) it is also the most
convenient way to install *mulle-sde* and [mulle-clang](//github.com/Codeon-GmbH/mulle-clang).


Project      | Build Status
-------------|-----------------------------------
![Logo](https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/logo.png)| ![Mulle kybernetiK tag](https://img.shields.io/github/tag/MulleFoundation/foundation-developer.svg) [![Build Status](https://travis-ci.org/MulleFoundation/foundation-developer.svg?branch=release)](https://travis-ci.org/MulleFoundation/foundation-developer)


*foundation-developer* enables the use of `<Foundation/Foundation.h>` in your
projects. It is very thin package atop of
[mulle-foundation-developer](//github.com/MulleFoundation/mulle-foundation-developer).

See *Usage* below for a quick introduction to get you up and running.

For further details, use the [mulle-objc Community](//mulle-objc.github.io)
page as the starting point on the *MulleFoundation* and *mulle-objc* in general.
See [mulle-sde Wiki](//github.com/mulle-sde/mulle-sde/wiki) for an introduction
to *mulle-sde*.


Extension                 | Type | Description
--------------------------|------|----------------------------
foundation/objc-developer | meta | Create Objective-C projects


## Install

The initial install will only add *mulle-sde* and *mulle-clang* to your
system. The Foundation itself will be fetched by *mulle-sde*, when you create
a new project (see **Usage** below).

> See the [Foundation](//github.com/MulleFoundation/Foundation)
> if you want to build the *MulleFoundation* without creating a *mulle-sde* project.


### Packages

OS      | Command
--------|------------------------------------
macos   | `brew install mulle-kybernetik/software/foundation-developer`
debian  | `sudo apt-get -y install foundation-developer` (but see below)
ubuntu  | same as debian


#### Debian Mulle kybernetiK and Codeon repositories

As root can use this one-liner to run an [installation script](https://github.com/MulleFoundation/foundation-developer/blob/release/bin/apt-installer):

```
wget -O - https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/bin/apt-installer | sh
```

> #### Prerequisities
>
> Package          | Comment
> -----------------|--------------------------
> `wget` or `curl` | to fetch the script (duh)
> `gnupg`          | **apt-key** may require it


Or do it manually. For apt installation you need to add the Mulle kybernetiK
and Codeon debian repositories first.

## Add Codeon and Mulle kybernetiK repositories

Install the GPG keys: 

```
wget -qO - "https://www.codeon.de/dists/codeon-pub.asc" | sudo apt-key add -
wget -qO - "https://www.mulle-kybernetik.com/dists/debian-admin-pub.asc" | sudo apt-key add -
```

Ensure apt is set up to work with https sources:

```
sudo apt-get install apt-transport-https
```

Add the *apt* repository source list: 

```
echo "deb [arch=amd64] http://download.codeon.de `lsb_release -c -s` main" | sudo tee /etc/apt/sources.list.d/codeon.de-main.list > /dev/null
echo "deb [arch=all] http://www.mulle-kybernetik.com `lsb_release -c -s` main" | sudo tee "/etc/apt/sources.list.d/mulle-kybernetik.com-main.list" > /dev/null
```

Update *apt* and install *foundation-developer*:

```
sudo apt-get update
sudo apt-get install foundation-developer

```

### Script

*mulle-sde* provides an [installer-all](https://raw.githubusercontent.com/mulle-sde/mulle-sde/release/bin/installer-all) script to install the required commands and foundation-developer into `/usr` or some other place.

You need to install [mulle-clang](//github.com/Codeon-GmbH/mulle-clang) yourself.

This is suitable for environments without supported package managers:

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

You need to install [mulle-clang](//github.com/Codeon-GmbH/mulle-clang) yourself.

### Docker

There is a [Dockerfile](https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile) in the project.

This will build and run an ephemeral container named `foundation` on
ubuntu:

```
sudo docker build -t foundation 'https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile'
sudo docker run -i -t --rm foundation
```


# Usage

#### Check that the (meta) extensions are found:

```
mulle-sde extension show
```

### Create an Objective-C executable project

```
mkdir foo
cd foo
mulle-sde init -m foundation/objc-developer executable
```

### Create an Objective-C library project

```
mulle-sde init -m foundation/objc-developer -d foolib library
```

### Don't create a project but get ObjC libraries built

```
mulle-sde init -m foundation/objc-developer none
mulle-sde craft
```

# How to write Objective-C

This is a list of resources useful when starting to write Objective-C.

## Programming with Objective-C, by Apple

[Programming With Objective C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) covers all the basics. Ignore the chapter about "Blocks", everything else should be fine.

## Concepts in Objective-C Programming, by Apple

[Concepts in Objective-C Programming](https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Introduction/Introduction.html) is more in-depth and is a good read to understand some terminology used by fellow Objective-C coders. Ignore the chapters "Delegates and Data Sources", "Model View Controller", "Object Modeling", "Outlets", "Receptionist Pattern", "Target-Action", "Toll-Free Bridging"

## Learn Objective-C, CocoaDev

[Learn Objective-C](https://www.cocoadevcentral.com/d/learn_objectivec) gives a quick overview of concepts. Ignore the part about "Dot Syntax" though.

## Learn-C.org

An interactive tutorial site to learn the basics of C is
[learn-c.org free interactive C tutorial](https://www.learn-c.org)


# Relations

![package relationships](dox/relationships.png)
