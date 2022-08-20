require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  github = {
    download_url_template = "git@github.com/%s/releases/download/%s/%s",
  },
})

