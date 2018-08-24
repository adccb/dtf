require "fileutils"

fu = ENV['env'] ? FileUtils : FileUtils::DryRun

# create all necessary dirs
fu.mkdir_p '~/.vim'
fu.mkdir_p '~/.hammerspoon'
fu.mkdir_p '~/.config'

# do all the goddamn symlinks
fu.ln_sf '~/.dtf/zshrc', '~/.zshrc'
fu.ln_sf '~/.dtf/init.lua', '~/.hammerspoon/init.lua'
fu.ln_sf '~/.dtf/nvim', '~/.config/nvim'
fu.ln_sf '~/.dtf/gitignore_global', '~/.gitignore_global'

