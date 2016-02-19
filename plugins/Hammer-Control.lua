do

local function run(msg, matches)
if not is_sudo(msg) then
 return nil
 end

 if msg.to.type == 'channel' then
 if matches[1] == "kick" then
Channel = 'channel#'..msg.to.id
user = 'user#'..matches[2]
 channel_kick_user(Channel, user, ok_cb, true)
end

 if matches[1] == "id" then
  if msg.to.type == "user" then
   return "Your Name: "..msg.to.first_name.. "\n\nYour ID: "..msg.from.id.."\n\nYour Phone : "..msg.from.phone.."\n\nYour USername : "..msg.from.username
  end
  
  if msg.to.type == 'channel' then
   if matches[1] == 'id' then
     local name = user_print_name(msg.from)
     if result.phone then
      phone = +"..result.phone
     else
      phone = 'None'
     end
     if result.username then
      username = @"..result.username
     else
      username = 'None'
      end
    return "SuperGroup NAME : " ..string.gsub(msg.to.print_name, "_", " ").. "\nSuperGroup iD : "..msg.to.id.."\nYour ID : "..msg.from.id.."\nYour Phone : "..phone.."\nYour Username : "...username

if matches[1] == "invite" then
Channel = 'channel#'..msg.to.id
user = 'user#'..matches[2]
channel_invite_user(Channel, user, ok_cb, true)
 end
 end
 
 return {
 description = "Member Controller plugin!",
 usage = {
  "/kick <UserID> : kick somone from supergroup",
  "/invite <UserID> : invite user to supergroup"
  },
 patterns = {
 "^/(kick) (%d+)$",
 "^/(invite) (%d+)$"
 },
 run = run
}

end
