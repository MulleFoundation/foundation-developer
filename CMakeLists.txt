cmake_minimum_required( VERSION 3.0)

project( foundation-developer NONE)

set( PROJECT_VERSION 0.19.0)


set( EXTENSIONS
   src/  #backslash is important
)


INSTALL( FILES ${SCRIPTS}
   PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
            GROUP_EXECUTE GROUP_READ
            WORLD_EXECUTE WORLD_READ
   DESTINATION "bin"
)

install( DIRECTORY ${EXTENSIONS}
   DESTINATION "share/mulle-sde/extensions"
   USE_SOURCE_PERMISSIONS
   PATTERN "*._DS_Store" EXCLUDE
   PATTERN "*.ignore" EXCLUDE
)


######
#
# must be after CPACK_PACKAGE_VERSION
include( CMakePackage.cmake) # need extension
include( CPack)
