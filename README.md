# foundation-developer

#### 👒 Objective C with mulle-sde and the mulle-objc Foundation

**foundation-developer** is a collection of *mulle-sde extensions* to support 
development with the [MulleFoundation](//github.com/MulleFoundation) and
the [Apple Foundation](https://developer.apple.com/documentation/foundation?language=objc).
As a package for **homebrew** (OS X) and **apt** (Linux) *foundation-developer*
is the most convenient way to install [mulle-objc](//github.com/mulle-objc)
and [mulle-sde](//github.com/mulle-sde).

Installing foundation-developer is also the main way to install all the other
developer packages, like mulle-objc-developer or mulle-core-developer.

See [The mulle-objc Community](//mulle-objc.github.io) for more information about
*mulle-objc* and *mulle-sde*.





## Usage

The following examples show how to use the *MulleFoundation* with the
*mulle-sde* environment. If you prefer `Makefiles` or some such, read about
the [legacy workflow](https://mulle-objc.github.io/De-Re-mulle-objc/mydoc_legacy.html).


### Check that the (meta) extensions are found:

``` sh
mulle-sde extension show
```


### Create an Objective-C executable project

This kind of project works with the Apple Foundation on macOS and with the
MulleFoundation everywhere else:

``` sh
mkdir foo
cd foo
mulle-sde init -m foundation/compat-objc-developer executable
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





### You are here

![Overview](overview.dot.svg)


## Install

An initial install will only add *mulle-sde* to your system. The
MulleFoundation itself will be fetched by *mulle-sde*, if needed, when you
craft your project for the first time.

### Packages


| OS     | Package manager | Install Command                                                |
|--------|-----------------|--------------------------------------------------------------- |
| macos  | homebrew        | `brew install mulle-kybernetik/software/foundation-developer`  |
| debian | apt             | `sudo apt-get -y install foundation-developer` (but see below) |
| ubuntu | apt             | `sudo apt-get -y install foundation-developer` (but see below) |


For debian/ubuntu, you can use this one-liner to install everything including
apt keys, that are likely to be required:

``` sh
wget -qO - https://raw.githubusercontent.com/MulleFoundation/foundation-developer/refs/heads/master/bin/apt-installer \
| sudo sh
```

### Script

The script approach is suitable for all environments, but especially for those
without a supported package managers like for instance *Fedora* or *FreeBSD*

| Prerequisites (debian) | Comment                                                |
|------------------------|--------------------------------------------------------|
| `build-essential`      | The usual compiler tools like cc, ar, nm               |
| `curl`                 | To fetch stuff, or substitute with wget                |
| `cmake`                | Shoot for cmake 3.15 or higher                         |
| `sudo`                 | Or run everything as root                              |
| `bsdmainutils`         | Needed for `column`. A dependency that should go away. |


#### Install into /usr/local with sudo

``` sh
curl -L -O 'https://raw.githubusercontent.com/MulleFoundation/foundation-developer/refs/heads/master/bin/installer' && \
chmod 755 installer-all && \
sudo OTHER_PROJECTS="MulleFoundation/foundation-developer; \
MulleFoundation/mulle-foundation-developer; \
mulle-objc/mulle-objc-developer; \
mulle-core/mulle-core-developer; \
mulle-c/mulle-c-developer;" \
SDE_PROJECTS="mulle-sde-developer; \
mulle-test;" \
./installer-all /usr/local
```

You need to install the compiler [mulle-clang](//github.com/mulle-cc/mulle-clang-project)
and the debugger [mulle-gdb](//github.com/mulle-cc/mulle-gdb) separately (see
next step)


#### Install into ${HOME} (without sudo)

``` sh
curl -L -O 'https://raw.githubusercontent.com/MulleFoundation/foundation-developer/refs/heads/master/bin/installer' && \
chmod 755 installer-all && \
OTHER_PROJECTS="MulleFoundation/foundation-developer; \
MulleFoundation/mulle-foundation-developer; \
mulle-objc/mulle-objc-developer; \
mulle-core/mulle-core-developer; \
mulle-c/mulle-c-developer;" \
SDE_PROJECTS="mulle-sde-developer; \
mulle-test;" \
./installer-all ~ no
```

#### Install mulle-clang and mulle-gdb

The installation will always go into `/opt` and therefore will need *sudo*.
Instructions how to unpack and relocate the installation manually are given on
the [compiler releases](//github.com/mulle-cc/mulle-clang-project/releases)
page:

``` sh
curl -L -O "https://github.com/mulle-cc/mulle-clang-project/releases/download/17.0.6.2/mulle-clang-17.0.6.2-bookworm-amd64.deb"
sudo dpkg --install "mulle-clang-17.0.6.2-bookworm-amd64.deb"
```

Check the [debugger releases](//github.com/mulle-cc/mulle-gdb/releases)
for the proper version to download:

``` sh
curl -L -O "https://github.com/mulle-cc/mulle-gdb/releases/download/11.1.0.0/mulle-gdb_11.1.0-1_bullseye_amd64.deb"
sudo dpkg --install "mulle-gdb_11.1.0-1_bullseye_amd64.deb"
```

### apt - Manual install

#### Install Prerequisites

As prerequisites there are some very basic packages that need to be installed
first. They are usually present on any but a barebones system.

| Package               | Comment                          |
|-----------------------|----------------------------------|
| `wget` or `curl`      | to fetch stuff                   |
| `gnupg`               | *apt-key* may require it         |
| `lsb-release`         | For the repository source list   |
| `apt-transport-https` | To let *apt-get* fetch via https |
| `sudo`                | Or run everything as root        |
| `libncurses5`         | Debian only (?)                  |


``` sh
apt-get install apt-transport-https gnupg lsb-release sudo wget
```

From here on it's assumed, that sudo is installed. If you don't have *sudo*,
edit out the *sudo* from the command lines and run everything as `root`


#### Install the GPG keys:

Or you can do the install manually. First add the necessary key to *apt*:

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


#### Install mulle-clang and mulle-gdb

``` sh
curl -L -O "https://github.com/mulle-cc/mulle-clang-project/releases/download/17.0.6.2/mulle-clang-17.0.6.0-bullseye-amd64.deb"
sudo dpkg --install "mulle-clang-17.0.6.0-bullseye-amd64.deb"
```

Check the [debugger releases](//github.com/mulle-cc/mulle-gdb/releases)
for the proper version to download:

``` sh
curl -L -O "https://github.com/mulle-cc/mulle-gdb/releases/download/11.1.0.0/mulle-gdb_11.1.0-1_bullseye_amd64.deb"
sudo dpkg --install "mulle-gdb_11.1.0-1_bullseye_amd64.deb"
```

### Docker

Docker images are published to [dockerhub](https://hub.docker.com/r/mulleobjc/foundation).
Pull an image with:

```sh
sudo docker pull mulleobjc/foundation
```

Run it with:

``` sh
sudo docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -i -t mulleobjc/foundation:latest
```

You can also build the docker image with the
[Dockerfile](https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile):


``` sh
sudo docker build -t foundation 'https://raw.githubusercontent.com/MulleFoundation/foundation-developer/release/Dockerfile'
sudo docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -i -t foundation
```



## Author

[Nat!](https://mulle-kybernetik.com/weblog) for Mulle kybernetiK  


