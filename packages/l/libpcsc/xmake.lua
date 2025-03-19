package("libpcsc")
    set_homepage("https://github.com/seffradev/libpcsc")
    set_description("C++ library for accessing smart cards using the PC/SC API ")
    set_license("MIT")

    add_urls("https://github.com/seffradev/libpcsc.git")
    add_versions("2025.03.19", "7fa3e014f24521bfff3682c215961f18ac3f3661")

    add_deps("cmake")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:is_debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs)
    end)

    on_test(function (package)
    end)
