## Legacy Workflow Support

### Install Foundation as a shared library

To support development outside of the *mulle-sde* workflow, you can
build a "whole-archive" shared library of the *MulleFoundation* with all its
dependencies such as [mulle-core](//github.com/mulle-core) and
[mulle-objc-runtime](//github.com/mulle-objc-runtime) included.

Install [foundation-developer](//github.com/MulleFoundation/foundation-developer)
first.

The following example builds a `libFoundation.so` on Linux and installs it
and the required headers into your `~/usr` directory:

```
$ mulle-sde install --standalone --prefix "${HOME}/usr" "https://github.com/MulleFoundation/Foundation/archive/latest.zip"
```

> #### Homebrew support
>
> On MacOS there is a brew formula, which will install a
> `libFoundation.dylib` and all required headers into `/usr/local`:
>
> ```
> brew install mulle-kybernetik/software/Foundation
> ```


### Use Foundation as a shared library

It's assumed you used `mulle-sde install` on Linux and `brew install` on MacOS.


#### Linux:

```
$ mulle-clang -isystem "${HOME}/include" -L"${HOME}/lib" -Wl,-rpath -Wl,"${HOME}/lib" -lFoundation
```

The executable needs to know where to find the shared library with `-Wl,-rpath -Wl,"${HOME}/lib"`.


#### MacOS:

```
$ XCODE_SDK_DIR="`xcrun --show-sdk-path`"
$ mulle-clang -isystem "/usr/local/include" -isystem "${XCODE_SDK_DIR}/include" -L"/usr/local/lib" -Wl,-rpath -Wl,"/usr/local/lib" -lFoundation
```

Explanation:

mulle-clang needs the standard C headers from the Xcode SDK. So tell
mulle-clang where they are with `-isystem "${XCODE_SDK_DIR}/include"`.
The executable learns where to find the shared library with
`-Wl,-rpath -Wl,"/usr/local/lib"`.

