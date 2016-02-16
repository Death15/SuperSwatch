do

local function check_member(cb_extra, success, result)
   local receiver = cb_extra.receiver
   local data = cb_extra.data
   local msg = cb_extra.msg
   for k,v in pairs(result.members) do
      local member_id = v.id
      if member_id ~= our_id then
          local username = v.username
          data[tostring(msg.to.id)] = {
              moderators = {[tostring(member_id)] = username},
              settings = {
                  set_name = string.gsub(msg.to.print_name, '_', ' '),
                  lock_name = 'no',
                  lock_photo = 'no',
                  lock_member = 'no'
                  }
            }
          save_data(_config.moderation.data, data)
          return send_large_msg(receiver, 'You have been promoted as moderator for this group.')
      end
    end
end

local function automodadd(msg)
    local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
      receiver = get_receiver(msg)
      chat_info(receiver, check_member,{receiver=receiver, data=data, msg = msg})
  else
      if data[tostring(msg.to.id)] then
        return 'Group is already added.'
      end
      if msg.from.username then
          username = msg.from.username
      else
          username = msg.from.print_name
      end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
          moderators ={[tostring(msg.from.id)] = username},
          settings = {
              set_name = string.gsub(msg.to.print_name, '_', ' '),
              lock_chat = 'no',
              lock_member = 'no'
              }
          }
      save_data(_config.moderation.data, data)
      return 'Group has been added, and @'..username..' has been promoted as moderator for this group.'
   end
end

local function modadd(msg)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
        return "You're not admin"
    end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
    return 'Group is already added.'
  end
    -- create data array in moderation.json
  data[tostring(msg.to.id)] = {
      moderators ={},
      settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_chat = 'no',
          lock_member = 'no'
          }
      }
  save_data(_config.moderation.data, data)

  return 'Group has been added.'
end

local function modrem(msg)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
        return "You're not admin"
    end
    local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
  if not data[tostring(msg.to.id)] then
    return 'Group is not added.'
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)

  return 'Group has been removed'
end

local function run(msg,matches)
if not is_sudo(msg) then
return nil
end

if matches[1] == 'modadd' then
return modadd(msg)
end

if matches[1] == 'modrem' then
return modrem(msg)
  end
end

return {
patterns = {
"^/(modadd)$",
"^/(modrem)$"
},
run = run
}

end
