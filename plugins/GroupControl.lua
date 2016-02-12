-- data saved to moderation.json
-- check moderation plugin
do

local function create_group(msg)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_sudo(msg) then
        return "You're not admin!"
    end
    local group_creator = msg.from.print_name
    create_group_chat (group_creator, group_name, ok_cb, false)
	return 'Group '..string.gsub(group_name, '_', ' ')..' has been created.'
end

local function set_description(msg, data)
    if not is_momod(msg) then
        return "For moderators only!"
    end
    local data_cat = 'description'
	data[tostring(msg.to.id)][data_cat] = deskripsi
	save_data(_config.moderation.data, data)

	return 'Set group description to:\n'..deskripsi
end

local function get_description(msg, data)
    local data_cat = 'description'
    if not data[tostring(msg.to.id)][data_cat] then
		return 'No description available.'
	end
    local about = data[tostring(msg.to.id)][data_cat]
    local about = string.gsub(msg.to.print_name, "_", " ")..':\n\n'..about
    return 'About '..about
end

local function set_rules(msg, data)
    if not is_momod(msg) then
        return "For moderators only!"
    end
    local data_cat = 'rules'
	data[tostring(msg.to.id)][data_cat] = rules
	save_data(_config.moderation.data, data)

	return 'Set group rules to:\n'..rules
end

local function get_rules(msg, data)
    local data_cat = 'rules'
    if not data[tostring(msg.to.id)][data_cat] then
		return 'No rules available.'
	end
    local rules = data[tostring(msg.to.id)][data_cat]
    local rules = string.gsub(msg.to.print_name, '_', ' ')..' rules:\n\n'..rules
    return rules
end

local function lock_group_silent(msg, data)
  if not is_sudo(msg) then
    return 'for Sudo only'
  end
  local group_silent_lock = data[tostring(msg.to.id)]['settings']['silent_protection']
	if group_silent_lock == 'yes' then
	    return 'Silent Protection is already Enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_protection'] = 'yes'
	    save_data(_config.moderation.data, data)
	end
	return 'Silent protection has been enabled'
end

local function unlock_group_slent(msg, data)
    if not is_sudo(msg) then
        return "For Sudoers only!"
    end
    local group_member_lock = data[tostring(msg.to.id)]['settings']['silent_protection']
	if group_member_lock == 'no' then
	    return 'Silent Protection is not enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_protection'] = 'no'
	    save_data(_config.moderation.data, data)
	return 'Silent Protection has been disabled'
    end
end
-- show group settings
local function show_group_settings(msg, data)
    if not is_momod(msg) then
        return "For moderators only!"
    end
    local settings = data[tostring(msg.to.id)]['settings']
    local text = "SuperGroup settings:\nSilent Protection : "..settings.silent_protection
    return text
end
--vardump(msg)
    if matches[1] == 'creategroup' and matches[2] then
        group_name = matches[2]
        return create_group(msg)
    end
    if matches[1] == 'adminslist' then
      if msg.to.type == 'channel' then
        return channel_get_admins(msg, admins, peer_id)
    if data[tostring(msg.to.id)] then
		local settings = data[tostring(msg.to.id)]['settings']
		if matches[1] == 'setabout' and matches[2] then
		    deskripsi = matches[2]
		    return set_description(msg, data)
		end
		if matches[1] == 'about' then
		    return get_description(msg, data)
		end
		if matches[1] == 'setrules' then
		    rules = matches[2]
		    return set_rules(msg, data)
		end
		if matches[1] == 'rules' then
		    return get_rules(msg, data)
		end
		if matches[1] == 'supergroup' and matches[2] == '+' then --group lock *
		    if matches[3] == 'silent' then
		        return lock_group_silent(msg, data)
	        end
	        if matches[1] == 'supergroup' and matches[2] == '-' then --group unlock*
	          if matches[3] == 'silent' then
		        return unlock_group_silent(msg, data)
		        end
	        if matches[1] == 'gp' and matches[2] == '?' then
		    return show_group_settings(msg, data)
		end


local function channel_get_admins(msg, admins, peer_id)
local channel = msg.to.id
local chan = ("%s#id%s"):format(msg.to.type, msg.to.id)
if msg.to.type == 'channel' then
        channel_get_admins(chan, channelAdminIDs, {receiver=receiver})
        end
  end
        return {
  description = "get Supergroup Admins.",
  usage = {
    "/creategroup : create a valid group",
    "/setabout : set group about",
    "/setrules : setgroup rules",
    "/supergroup + silent : silent chat",
    "supergroup ? : show supergroup settings",
    "/adminslist : get supergroups admins"
  },
  patterns = {
    "/creategroup (.*)$",
    "/setabout (.*)$",
    "/setrules (.*)$",
    "/supergroup(+) (.*)$",
    "/supergroup (-) (.*)$",
    "/supergroup (?)$",
    "^/adminslist$"
  },
  run = run
}
