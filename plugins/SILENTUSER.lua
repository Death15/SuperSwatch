local function run(msg, matches)
    local receiver = get_receiver(msg)
  
      local hash_enable1 = 'silentuser:'..msg.from.id..':'..msg.to.id
  local enabled1 = redis:get(hash_enable1)
  
    if msg.to.type == 'channel' and not is_sudo(msg) and enabled1 then
          msgr = delete_msg(msg.id, ok_cb, false)
      end
end
return{
    patterns = {
    "^(.+)"
  },
  moderated = true,
  run = run
}
