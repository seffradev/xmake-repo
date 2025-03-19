package("simtrace2")
    set_homepage("https://osmocom.org/projects/simtrace2/wiki")
    set_description("Osmocom SIM card tracer, v2.0; mirror of https://gitea.osmocom.org/sim-card/simtrace2")

    add_urls("https://github.com/osmocom/simtrace2.git")
    add_versions("2025.02.12", "c38ad746f23cdd87321db6240e27ffc67652cc44")

    add_deps("libosmocore")
    add_deps("autoconf", "automake", "libtool")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "--enable-shared=" .. (package:config("shared") and "yes" or "no"))
        if package:is_debug() then
            table.insert(configs, "--enable-debug")
        end
        import("package.tools.make").build(package, makeconfigs)
        import("package.tools.make").make(package, {"install"})
    end)

    on_test(function (package)
    end)
