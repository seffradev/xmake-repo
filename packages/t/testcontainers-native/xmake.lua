package("testcontainers-native")
    set_homepage("https://testcontainers.github.io/testcontainers-native/")
    set_description("Testcontainers for C/C++/Swift and other native projects, built on the top of Testcontainers for Go")
    set_license("MIT")

    add_urls("https://github.com/testcontainers/testcontainers-native/archive/refs/tags/$(version).tar.gz",
             "https://github.com/testcontainers/testcontainers-native.git")

    add_versions("v0.1.0", "6d366c21bc725b40316608196f02a4808ff85fe64482971ef74d4215218be18a")

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
