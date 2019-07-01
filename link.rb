require "fileutils"

fu = ENV["env"] == "go" ? FileUtils : FileUtils::DryRun

dir_locations = [
  "/Users/acrossan/.hammerspoon/",
  "/Users/acrossan/.config/",
  "/Users/acrossan/.config/karabiner"
]

symlink_locations = {
  "/Users/acrossan/.dtf/zshrc" => "/Users/acrossan/.zshrc",
  "/Users/acrossan/.dtf/init.lua" => "/Users/acrossan/.hammerspoon/init.lua",
  "/Users/acrossan/.dtf/nvim" => "/Users/acrossan/.config/nvim",
  "/Users/acrossan/.dtf/gitignore_global" => "/Users/acrossan/.gitignore_global",
  "/Users/acrossan/.dtf/karabiner.json" => "/Users/acrossan/.config/karabiner/karabiner.json",
}

def remove_hostname (str) str.gsub "/Users/acrossan/", "" end

if ENV["env"] != "go"
  puts "NOTE: this run didn't do anything. if you want to\nactually change your system, run the following command:"
  puts "\n\s\s\s\s$ env=go ruby link.rb\n\n\n"
end

puts "creating directories...\n\n"
dir_locations.each do |fname|
  if File.exist? fname
    puts "#{remove_hostname fname} exists, skipping..."
  else
    puts "creating #{remove_hostname fname}..."
    fu.mkdir_p fname
  end
end

puts "\ncreating symlinks...\n\n"
symlink_locations.each do |source, target|
  if File.exist? target
    puts "#{remove_hostname target} is already symlinked, skipping..."
  else
    puts "symlinking #{remove_hostname source} to #{remove_hostname target}"
    fu.ln_sf source, target
  end
end

