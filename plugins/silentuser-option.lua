local function run(msg, matches)
  if not is_momod(msg) then
    return ""
  end
  
local hash_fa = fa:enabled:'msg.to.id
local faenabled = redis:get(fash_fa)
local hash = 'silentuser:'..matches[2]..':'..matches[3]..'..channel
local user = "user#id"matches[2]
local channel = msg.to.id
if matches[1] == "silent" and matches[3] == "audio" then
  redis:set(hash, true)
if faenabled then
  text1 = "یوزر از فرستادن ویس محروم شد"
else
  text1 = "User "..matches[2].." has been muted from sending audio"
end
return text1
end
if matches[1] "unsilent" and matches[3] == "audio" then
  redis:del(hash)
  if faenabled then
    text2 = "یوزر مجاز به فرستادن ویس شد"
  else
    text2 = "User "..matches[2].." has been unmuted from sending audio"
  end
end
return {
  patterns = {
    "^/(silent) (%d+) (audio)$",
    "^/(unsilent) (%d+) (audio)$"
    },
  run = run
  }
