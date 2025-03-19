package("libosmocore")
    set_homepage("https://osmocom.org/projects/libosmocore")
    set_description("Osmocom core libraries; mirrored from https://gitea.osmocom.org/osmocom/libosmocore")
    set_license("GPL-2.0")

    add_urls("https://github.com/osmocom/libosmocore.git")
    add_versions("2025.03.17", "8111511b1910103572ccc91cf8df93276b67bbb2")

    add_deps("autoconf", "automake", "libtool")

    add_includedirs("include/osmocom")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "--enable-shared=" .. (package:config("shared") and "yes" or "no"))
        if package:is_debug() then
            table.insert(configs, "--enable-debug")
        end
        import("package.tools.autoconf").install(package, configs)
    end)

    on_test(function (package)
    end)
