package("libelectronic-id")
    set_homepage("https://github.com/seffradev/libelectronic-id")
    set_description("C++ library for performing cryptographic operations with electronic ID smart cards")
    set_license("MIT")

    add_urls("https://github.com/seffradev/libelectronic-id.git")
    add_versions("2025.02.17", "91b29d452abc0f0f0b1eb8daeddb444519d43171")

    add_deps("cmake")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:is_debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:has_cfuncs("foo", {includes = "foo.h"}))
    end)
