local function run(msg,matches)
local bot_id = our_id
if matches[1] "leavegroup" and is_sudo(msg) then
chat_del_user("chat#id"..msg.to.id, user#id'..bot_id, ok_cb, false)
elseif msg.action.type == "chat_add_user" and msg.action.user.id == tonumber(bot_id) and not is_sudo(msg) then
chat_del_user("chat#id"..msg.to.id, user#id"..bot_id,ok_cb,false)
end
end

return {
patterns = { 
"^/leavegroup$",
"^!!tgservice (.*)
},
run = run
}
end
