
function(_check_os)
    if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
        set(TARGET_WINDOWS True BOOL PARENT_SCOPE)
        if(CMAKE_SIZEOF_VOID_P EQUAL 8)
            set(TARGET_WINDOWS_64 True BOOL PARENT_SCOPE)
            set(ARCH_NAME "x64" PARENT_SCOPE)
            set(ARCH_NAME_X "x64" PARENT_SCOPE)
        elseif(CMAKE_SIZEOF_VOID_P EQUAL 4) 
            set(TARGET_WINDOWS_32 True BOOL PARENT_SCOPE)
        else()
            set(TARGET_WINDOWS_UNKNOWN True BOOL PARENT_SCOPE)
        endif()  
        set(TARGET_PLATFORM_UPPER_CASE "WINDOWS" BOOL PARENT_SCOPE)
        set(OS_NAME_X "win" PARENT_SCOPE)

		#message("Building on Windows")
    elseif (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
        set(TARGET_LINUX   True BOOL PARENT_SCOPE)
        set(TARGET_PLATFORM_UPPER_CASE "LINUX" BOOL PARENT_SCOPE)
        set(OS_NAME_X "linux" PARENT_SCOPE)
		#message("Building on Linux")
    elseif (${CMAKE_SYSTEM_NAME} STREQUAL "Android")
        set(TARGET_ANDROID True BOOL PARENT_SCOPE)
        set(TARGET_PLATFORM_UPPER_CASE "ANDROID" BOOL PARENT_SCOPE)
        set(OS_NAME_X "android" PARENT_SCOPE)
        set(ARCH_NAME ${ANDROID_ABI} PARENT_SCOPE)
        set(ARCH_NAME_X ${ANDROID_ABI} PARENT_SCOPE)    
    elseif (${CMAKE_SYSTEM_NAME} STREQUAL "iOS" )
        set(TARGET_IOS     True BOOL PARENT_SCOPE)
        set(TARGET_APPLE   True BOOL PARENT_SCOPE)
        set(TARGET_PLATFORM_UPPER_CASE "IOS" BOOL PARENT_SCOPE)
        set(OS_NAME_X "ios" PARENT_SCOPE)
        set(IOS_BUILD_TARGET "OS" PARENT_SCOPE)
        set(TARGET_IOS True BOOL PARENT_SCOPE)
        if (CMAKE_OSX_ARCHITECTURES MATCHES ".*arm.*")
            set(ARCH_NAME "arm64" PARENT_SCOPE)
            set(ARCH_NAME_X "arm64" PARENT_SCOPE)
        elseif (CMAKE_OSX_ARCHITECTURES MATCHES "x86_64")
            set(ARCH_NAME "x86_64" PARENT_SCOPE)
            set(ARCH_NAME_X "x86_64" PARENT_SCOPE)
        endif()
        
     elseif (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin" AND IOS)
        set(TARGET_IOS     True BOOL PARENT_SCOPE)
        set(TARGET_APPLE   True BOOL PARENT_SCOPE)
        set(TARGET_PLATFORM_UPPER_CASE "IOS" BOOL PARENT_SCOPE)
        set(OS_NAME_X "ios" PARENT_SCOPE)
        set(IOS_BUILD_TARGET "OS" PARENT_SCOPE)
        message(${CMAKE_OSX_ARCHITECTURES})
        if (CMAKE_OSX_ARCHITECTURES MATCHES ".*arm.*")
            set(ARCH_NAME "arm64" PARENT_SCOPE)
            set(ARCH_NAME_X "arm64" PARENT_SCOPE)
        elseif (CMAKE_OSX_ARCHITECTURES MATCHES "x86_64")
            set(ARCH_NAME "x86_64" PARENT_SCOPE)
            set(ARCH_NAME_X "x86_64" PARENT_SCOPE)
        endif()
    elseif (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin" AND NOT IOS)
        set(TARGET_MACOSX  True BOOL PARENT_SCOPE)
        set(TARGET_APPLE   True BOOL PARENT_SCOPE)
        set(TARGET_PLATFORM_UPPER_CASE "MACOSX" BOOL PARENT_SCOPE)
        set(OS_NAME_X "mac" PARENT_SCOPE)
        if (CMAKE_OSX_ARCHITECTURES MATCHES ".*arm.*")
            set(ARCH_NAME "arm64" PARENT_SCOPE)
            set(ARCH_NAME_X "arm64" PARENT_SCOPE)
        else()
            set(ARCH_NAME "x64" PARENT_SCOPE)
            set(ARCH_NAME_X "x64" PARENT_SCOPE)
        endif()

        #message("Building on MACOSX")
    endif()
endfunction(_check_os)
