#!/usr/bin/env lua

print("Starting system updates...")

-- important image
os.execute("chafa --size=20x20 /home/cristiansbardelotto/Pictures/pfp/ralsei-fumante.webp")

-- get permission for the whole script
if not os.execute("sudo -v") then
  os.exit(1)
end
local pid = io.popen("echo $PPID"):read("*l")
os.execute(string.format(
  [[(while kill -0 %s 2>/dev/null; do sudo -n true; sleep 60; done) &]], pid
))

-- actual script
os.execute("sudo dnf -y autoremove")
os.execute("sudo dnf -y clean all")
os.execute("sudo dnf -y makecache")
os.execute("sudo flatpak -y update")
os.execute("sudo dnf -y upgrade")
os.execute("yes | trash-empty")

local downloads_path = os.getenv("HOME") .. "/Downloads"
local function get_downloads_size()
  local handle = io.popen(string.format([[du -sh "%s" 2>/dev/null | cut -f1]], downloads_path))
  if not handle then
    return "Error retrieving downloads folder size"
  end

  local result = handle:read("*a")
  handle:close()
  return result:gsub("\n", "")
end

print("")
print("Downloads folder size: " .. get_downloads_size())
print("Downloads folder directories:")
os.execute(string.format("ls %s", downloads_path))
print("")

print("Everything is up to date!")
