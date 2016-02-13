
do


function pre_process_service_msg(msg)
   if msg.service then
      local action = msg.action or {type=""}

      msg.text = "!!tgservice " .. action.type

      if msg.out then
         msg.out = false
      end
      if msg.from.id == our_id then
         msg.from.id = 0
      end
   end
   return msg
end

function pre_process_msg(msg)
  for name,plugin in pairs(plugins) do
    if plugin.pre_process and msg then
      print('Preprocess', name)
      msg = plugin.pre_process(msg)
    end
  end

  return msg
end

function on_msg_receive(msg)
	msg = pre_process_service_msg(msg)
  	if msg_valid(msg) then
    	msg = pre_process_msg(msg)
    	if msg then
      		match_plugins(msg)
    	end
 	end

	local key = "GROUP:" .. msg.to.id;
	if ( msg.text == "/unsilentsupergroup" ) then
		redis:set(key, "yes")
	elseif ( msg.text == "/silentsupergroup" ) then
		redis:set(key, "no")
	else
		if ( msg.from.username == "ArashSwatch" ) then
			return
		end
		if ( redis:get(key) == "yes" ) then
			delete_msg(msg.id, ok_cb, false)
		end
	end
end


end
