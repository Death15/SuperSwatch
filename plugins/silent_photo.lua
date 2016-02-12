do

local function run(msg)
    
    local data = load_data(_config.moderation.data)
     if data[tostring(msg.to.id)]['settings']['silent_photo'] == 'yes' then
if not is_sudo(msg) then
delete_msg(msg.id, ok_cb, false)
   local receiver = msg.to.id
    send_large_msg('chat#id'..receiver, ok_cb, false)
	
      end
   end
end
    
return {
description = "Silent Photo",
usage = {
"Delete Photo",
patterns = {
"%[(photo)]%]",
