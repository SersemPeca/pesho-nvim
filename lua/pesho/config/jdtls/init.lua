local M = {}

M.config = function()
    vim.notify("ALO DA")

    vim.api.nvim_create_autocmd(
        "FileType",
        {
            pattern = "java",
            callback = M.project_config,
        }
    )
end

M.project_config = function()

    local jdtls = require("jdtls")
    local jdtls_setup = require("jdtls.setup")
    local jdtls_install_dir = "/usr/share/java/jdtls"
    local system = "linux"
    local launcher_version = "1.6.500.v20230717-2134"

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

    local workspace_dir = "/home/pesho/.jdtls/" .. project_name

    local config = {
        cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar", jdtls_install_dir .. "/plugins/org.eclipse.equinox.launcher_" .. launcher_version .. ".jar",
            "-configuration", jdtls_install_dir .. "/config_" .. system,
            "-data", workspace_dir
        },

        root_dir = jdtls_setup.find_root({".git", "mvnw", "gradlew"}),

        settings = {

            java = {
                signatureHelp = {
                    enabled = true,
                },
                contentProvider = {
                    preferred = "fernflower",
                },
                import = {
                    gradle = {
                        annotationProcessing = {
                            enabled = true,
                        },
                    },
                },
            },
        },

        init_options = {
            bundles = {}
        },

    }

    jdtls.start_or_attach(config)
end
return M
