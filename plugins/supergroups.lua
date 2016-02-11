-- Checks if bot was disabled on specific chat
local function is_channel_disabled( receiver )
	if not _config.disabled_channels then
		return false
	end

	if _config.disabled_channels[receiver] == nil then
		return false
	end

  return _config.disabled_channels[receiver]
end

local function enable_channel(receiver)
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end

	if _config.disabled_channels[receiver] == nil then
		return 'Supergroup is not out of service!'
	end
	
	_config.disabled_channels[receiver] = false

	save_config()
	return "SuperGroup has been added!"
end

local function disable_channel( receiver )
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end
	
	_config.disabled_channels[receiver] = true

	save_config()
	return "SuperGroup has been removed!"
end

local function pre_process(msg)
	local receiver = get_receiver(msg)
	
	-- If sender is sudo then re-enable the channel
	if is_sudo(msg) then
	  if msg.text == "/supergroup +" then
	    enable_channel(receiver)
	  end
	end

  if is_channel_disabled(receiver) then
  	msg.text = ""
  end

	return msg
end

local function run(msg, matches)
	local receiver = get_receiver(msg)
	-- Enable a channel
	if matches[1] == '+' then
		return enable_channel(receiver)
	end
	-- Disable a channel
	if matches[1] == '-' then
		return disable_channel(receiver)
	end
end

return {
	description = "Plugin to manage channels. Enable or disable channel.", 
	usage = {
		"/supergroup +: enable current supergroup",
		"/supergroup -: disable current supergroup" },
	patterns = {
		"^/supergroup? (+)",
		"^/supergroup? (-)" }, 
	run = run,
	privileged = true,
	pre_process = pre_process
}
--by arashswatch
