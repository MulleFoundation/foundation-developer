# Xcode compilation with xcodebuild for macOS instead of mulle-objc

When you copy this to `.mulle/etc/craft/definition.darwin` this will disable
the `PROJECT_DIALECT` setting.

You can then enable xcode (and Apple Foundation) only builds with:

```
mulle-sde environment --os darwin MULLE_CRAFT_PLATFORMS xcode  # xcode:Default for both
```

Fine, now you just have to get the **MulleFoundation** out of the compilation
and link stage.

> MEMO: haven't done this in a long time. may need more experimenting