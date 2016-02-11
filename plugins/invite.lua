-- Invite other user to the chat group.
-- Use !invite name User_name or !invite id id_number
-- The User_name is the print_name (there are no spaces but _)

do

local function callback(extra, success, result)
  vardump(success)
  vardump(result)
end

local function run(msg, matches)
  local user = matches[2]

  -- User submitted a user name
  if matches[1] == "name" then
    user = string.gsub(user," ","_")
  end
  
  -- User submitted an id
  if matches[1] == "user" then
    user = 'user#id'..user
  end

  -- The message must come from a chat group
  if msg.to.type == 'channel' then
    local chat = 'channel#id'..msg.to.id
    channel_invite_user(channel, user, callback, false)
    return "Added "..user.." to "..chat
  else 
    return 'This isnt a  supergroup!'
  end

end

return {
  description = "Invite other user to the supergroup", 
  usage = {
    "!invite name [user_name]", 
    "!invite id [user_id]" },
  patterns = {
    "^!invite (name) (.*)$",
    "^!invite (user) (%d+)$"
  }, 
  run = run 
}

end
