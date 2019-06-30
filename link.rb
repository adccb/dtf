require "fileutils"

fu = ENV['env'] ? FileUtils : FileUtils::DryRun

# create all necessary dirs
fu.mkdir_p '/Users/acrossan/.hammerspoon/'
fu.mkdir_p '/Users/acrossan/.config/'

# do all the goddamn symlinks
fu.ln_sf '/Users/acrossan/.dtf/zshrc', '/Users/acrossan/.zshrc'
fu.ln_sf '/Users/acrossan/.dtf/init.lua', '/Users/acrossan/.hammerspoon/init.lua'
fu.ln_sf '/Users/acrossan/.dtf/nvim', '/Users/acrossan/.config/nvim'
fu.ln_sf '/Users/acrossan/.dtf/gitignore_global', '/Users/acrossan/.gitignore_global'

