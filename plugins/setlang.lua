local function run(msg, matches)
if not is_momod(msg) then
return "for MOderators Only"
end

local hash_fa = 'fa:enabled:'..msg.to.id
local faenabled = redis:get(hash_fa)
if matches[2] == "per" then
  return "زبان گروه به فارسی تغیر کرد"
  redis:set(hash_fa, true)
end

local hash_en = 'english:enabled:'..msg.to.id
local enenabled = redis:get(hash_en)
if matches[2] == "en" then
  return "Group Language Has been set to : <English>"
redis:del(hash_fa, true)
end

if not hash_fa then
  redis:get(hash_en, true)
end 
end

return {
  petterns = {
    "^/(setlang) (.*)$"
    },
  run = run
}

end
