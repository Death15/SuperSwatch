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

local function lock_group_photo(msg, data)
  if not is_sudo(msg) then
    return 'for Sudo only'
  end
  local group_photo_lock = data[tostring(msg.to.id)]['settings']['silent_photo']
	if group_photo_ == 'yes' then
	    return 'Silent Photo is already Enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_photo'] = 'yes'
	    save_data(_config.moderation.data, data)
	end
	return 'Silent photo has been enabled'
end

local function unlock_group_photo(msg, data)
    if not is_sudo(msg) then
        return "For Sudoers only!"
    end
    local group_photo_lock = data[tostring(msg.to.id)]['settings']['silent_photo']
	if group_photo_lock == 'no' then
	    return 'Silent photo is not enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_photo'] = 'no'
	    save_data(_config.moderation.data, data)
	return 'Silent Photo has been disabled'
end

  local function lock_group_video(msg, data)
  if not is_sudo(msg) then
    return 'for Sudo only'
  end
  local group_video_lock = data[tostring(msg.to.id)]['settings']['silent_video']
	if group_video_lock== 'yes' then
	    return 'Silent video is already Enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_video'] = 'yes'
	    save_data(_config.moderation.data, data)
	end
	return 'Silent video has been enabled'
end

local function unlock_group_video(msg, data)
    if not is_sudo(msg) then
        return "For Sudoers only!"
    end
    local group_video_lock = data[tostring(msg.to.id)]['settings']['silent_video']
	if group_video_lock == 'no' then
	    return 'Silent video is not enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_video'] = 'no'
	    save_data(_config.moderation.data, data)
	return 'Silent Video has been disabled'
end

    local function lock_group_voice(msg, data)
  if not is_sudo(msg) then
    return 'for Sudo only'
  end
  local group_gif_lock = data[tostring(msg.to.id)]['settings']['silent_voice']
	if group_voice_lock== 'yes' then
	    return 'Silent voice is already Enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_voice'] = 'yes'
	    save_data(_config.moderation.data, data)
	end
	return 'Silent voice has been enabled'
end

local function unlock_group_sticker(msg, data)
    if not is_sudo(msg) then
        return "For Sudoers only!"
    end
    local group_sticker_lock = data[tostring(msg.to.id)]['settings']['silent_sticker']
	if group_sticker_lock == 'no' then
	    return 'Silent sticker is not enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_sticker'] = 'no'
	    save_data(_config.moderation.data, data)
	return 'Silent sticker has been disabled'
  end
  
      local function lock_group_sticker(msg, data)
  if not is_sudo(msg) then
    return 'for Sudo only'
  end
  local group_sticker_lock = data[tostring(msg.to.id)]['settings']['silent_sticker']
	if group_sticker_lock == 'yes' then
	    return 'Silent sticker is already Enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_sticker'] = 'yes'
	    save_data(_config.moderation.data, data)
	end
	return 'Silent sticker has been enabled'
end

local function unlock_group_sticker(msg, data)
    if not is_sudo(msg) then
        return "For Sudoers only!"
    end
    local group_sticker_lock = data[tostring(msg.to.id)]['settings']['silent_sticker']
	if group_sticker_lock == 'no' then
	    return 'Silent sticker is not enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_sticker'] = 'no'
	    save_data(_config.moderation.data, data)
	return 'Silent sticker has been disabled'
  end
  
       local function lock_group_all(msg, data)
  if not is_sudo(msg) then
    return 'for Sudo only'
  end
  local group_all_lock = data[tostring(msg.to.id)]['settings']['silent_all']
	if group_all_lock == 'yes' then
	    return 'Silent all is already Enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_all'] = 'yes'
	    save_data(_config.moderation.data, data)
	end
	return 'Silent all has been enabled'
end

local function unlock_group_all(msg, data)
    if not is_sudo(msg) then
        return "For Sudoers only!"
    end
    local group_all_lock = data[tostring(msg.to.id)]['settings']['silent_all']
	if group_all_lock == 'no' then
	    return 'Silent all is not enabled'
	else
	    data[tostring(msg.to.id)]['settings']['silent_all'] = 'no'
	    save_data(_config.moderation.data, data)
	return 'Silent all has been disabled'
    end
end
-- show group settings
local function show_silent_settings(msg, data)
    if not is_sudo(msg) then
        return "For moderators only!"
    end
    local settings = data[tostring(msg.to.id)]['settings']
    local text = "Supergroup Sharing settings:\nSilent Photo : "..settings.silent_photo.."\nSilent Video :"..settings.silent_video.."\nSilent Voice : "..settings.silent_voice.."\nSilent Sticker : "..settings.silent_sticker.."\nSilent Protection : "..settings.silent_all
    return text
end
--vardump(msg)
    if matches[1] == 'creategroup' and matches[2] then
        group_name = matches[2]
        return create_group(msg)
    end
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
		if matches[1] == 'silent' and matches[2] == '+' then --group lock *
		    if matches[3] == 'photo' then
		        return lock_group_photo(msg, data)
	        end
	         if matches[3] == 'video' then
		        return lock_group_video(msg, data)
	        end
	         if matches[3] == 'voice' then
		        return lock_group_voice(msg, data)
	        end
	        if matches[3] == 'sticker' then
		        return lock_group_sticker(msg, data)
	        end
	        if matches[3] == 'all' then
		        return lock_group_all(msg, data)
	        end
	        if matches[1] == 'silent' and matches[2] == '-' then --group unlock*
	          if matches[3] == 'photo' then
		        return unlock_group_photo(msg, data)
	        end
	        if matches[3] == 'video' then
		        return unlock_group_video(msg, data)
	        end
	        if matches[3] == 'voice' then
		        return unlock_group_voice(msg, data)
	        end
	        if matches[3] == 'sticker' then
		        return unlock_group_sticker(msg, data)
	        end
	        if matches[3] == 'all' then
		        return unlock_group_all(msg, data)
		        end
	        if matches[1] == 'silent' and matches[2] == '?' then
		    return show_silent_settings(msg, data)
		end
  end
        return {
  description = "Silent Protection.",
  usage = {
    "/silent ? :show silent settings",
    "/silent + : silent option",
    "/silnet - : unsilent something"
  },
  patterns = {
    "/creategroup (.*)$",
    "/setabout (.*)$",
    "/about$",
    "/setrules (.*)$",
    "/rules$",
    "/silent (+) (.*)$",
    "/silent (-) (.*)$",
    "/silent (?)$"
    },
  run = run
}
--maded by @ArashSwatch
