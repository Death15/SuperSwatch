local function run (msg, matches)
     if not is_sudo(msg) then
         return
     end
     
          local hash_per = 'persian:enabled:'..msg.to.id
  local faenabled = redis:get(hash_fa)
     local user = matches[2]
      local chat = msg.to.id
    local hash = 'silentuser:'..matches[2]..':'..chat
    if matches[1] == 'silent' then
      redis:set(hash, true)
                        if faenabled then
          text1 = "سایلنت شد"..user
      else
          text1 = user.." has been silented"
          end
      return text1
    end
    if matches[1] == 'unsilent' then
      redis:del(hash)
                              if faenabled then
          text2 = 'از حالت بی صدا خارج شد'..user
      else
          text2 = user.." has been usilented"
          end
      return text2
    end
end
return {
  description = '',
  usage = {},
  patterns = {
    '^/(silent) (%d+)$',
    '^/(unsilent) (%d+)$'
  },
  run = run,
  privileged = true,
  pre_process = pre_process
}
