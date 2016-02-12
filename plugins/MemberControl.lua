do

local function run(msg, matches)
if not is_sudo(msg) then
 return nil
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

if msg.to.type == 'channel' then
 if matches[1] == "silent" and matches[2] == "user" then
 Channel = 'channel#'..msg.to.id
 user = 'user#'..matches[3]
  local silent_hash = 'user_silent:'..channel_id..':'..user_id
    local is_silented_offender = redis:get(silent_hash)
     if is_silented_offender then
  delete_msg(msg.id, ok_cb, true)
  redis:set(silent_hash, true)
end
if msg.to.type == 'channel' then
 if matches[1] == "unsilent" and matches[2] == "user" then
 Channel = 'channel#'..msg.to.id
 user = 'user#'..matches[3]
  local silent_hash = 'user_silent:'..channel_id..':'..user_id
    local is_silented_offender = redis:get(silent_hash)
     if is_silented_offender then
  delete_msg(msg.id, ok_cb, true)
  redis:del(silent_hash)
  
  end
end

return {
 description = "Member Controller plugin!",
 usage = {
  "/kick @USERNAME : kick somone from supergroup",
  "/invite @USERNAME : invite user to supergroup",
  "/kickme : kick ourself from Supergroup",
  "/silent user @USERNAME : Silent user in supergroup",
  "/unsilent user @USERNAME : Un silent User In SuperGroup"
  },
 patterns = {
 "^/(kick) (.*)$",
 "^/(invite) (.*)$",
 "^/kickme$",
 "^/silent (user) (.*)$",
 "^/(unsilent) (user) (.*)$"
 },
 run = run
}

end
