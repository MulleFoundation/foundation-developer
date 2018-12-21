if( NOT __ENVIRONMENT_AUX_CMAKE__)
   set( __ENVIRONMENT_AUX_CMAKE__ ON)

   if( MULLE_TRACE_INCLUDE)
      message( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
   endif()

   set( CMAKE_FIND_FRAMEWORK "LAST")

   include( ExecutableAuxObjC OPTIONAL)
endif()
