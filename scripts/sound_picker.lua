#!/usr/bin/env lua

local SOUNDS_DIR = os.getenv("HOME") .. "/Documents/sounds/"

local files_paths = io.popen(string.format(
  [[find "%s" -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.aiff" \)]],
  SOUNDS_DIR
))

local names = {}
if files_paths then
  for path in files_paths:lines() do
    table.insert(names, path:match("([^/]+)$"))
  end
  files_paths:close()
end

local tmp = os.tmpname()
local f = io.open(tmp, "w")
if f then
  f:write(table.concat(names, "\n"))
  f:close()
end

local rofi = io.popen(string.format(
  [[rofi -dmenu -p "select audio" -markup-rows < "%s"]], tmp
))

if not rofi then
  os.remove(tmp)
  return
end

local selected = rofi:read("*l")
rofi:close()
os.remove(tmp)

if selected and selected ~= "" then
  os.execute(string.format(
    [[ffplay -nodisp -autoexit "%s%s"]], SOUNDS_DIR, selected
  ))
end
