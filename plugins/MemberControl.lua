do

local function run(msg, matches)
if not is_sudo(msg) then
 return nil
 end

 if msg.to.type == 'chat'then
 if matches[1] == "kick" then
 chat = 'chat#'..msg.to.id
 user = 'user#'..matches[2]
 chat_del_user(chat, user, callback, false)
 end

 if matches[1] == "invite" then
 chat = 'chat#'..msg.to.id
 user = 'user#'..matches[2]
chat_add_user(chat, user, callback, false)
 end
 end

 if msg.to.type == 'channel'then
 if matches[1] == "kick" then
Channel = 'channel#'..msg.to.id
user = 'user#'..matches[2]
 channel_kick_user(Channel, user, ok_cb, true)
 end

if matches[1] == "invite" then
Channel = 'channel#'..msg.to.id
user = 'user#'..matches[2]
channel_invite_user(Channel, user, ok_cb, true)
 end

if msg.to.type == 'channel'then
 if matches[1] == "kickme" then
Channel = 'channel#'..msg.to.id
user = 'user#'..msg.from.id
 channel_kick_user(Channel, user, ok_cb, true)
 end

end
end

return {
 description = "Member Controller plugin!",
 usage = {
  "/kick @USERNAME : kick somone from supergroup",
  "/invite @USERNAME : invite user to supergroup",
  "/kickme : kick ourself from Supergroup"
  },
 patterns = {
 "^/(kick) (.*)$",
 "^/(invite) (.*)$",
 "^/kickme$"
 },
 run = run
}

end
