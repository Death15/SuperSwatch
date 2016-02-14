local function get_contact_list_callback (cb_extra, success, result)
  local text = " "
  for k,v in pairs(result) do
    if v.print_name and v.id and v.phone then
      text = text..string.gsub(v.print_name ,  "_" , " ").." ["..v.id.."] = "..v.phone.."\n"
    end
  end
  local file = io.open("contactlist.txt", "w")
  file:write(text)
  file:flush()
  file:close()
  send_document("user#id"..cb_extra.target,"contactlist.txt", ok_cb, false)--.txt format
  local file = io.open("contactlist.json", "w")
  file:write(json:encode_pretty(result))
  file:flush()
  file:close()
  send_document("user#id"..cb_extra.target,"contactlist.json", ok_cb, false)--json format
end
end
local function get_dialog_list_callback(cb_extra, success, result)
  local text = ""
  for k,v in pairs(result) do
    if v.peer then
      if v.peer.type == "chat" then
        text = text.."group{"..v.peer.title.."}["..v.peer.id.."]("..v.peer.members_num..")"
      else
        if v.peer.print_name and v.peer.id then
          text = text.."user{"..v.peer.print_name.."}["..v.peer.id.."]"
        end
        if v.peer.username then
          text = text.."("..v.peer.username..")"
        end
        if v.peer.phone then
          text = text.."'"..v.peer.phone.."'"
        end
      end
    end
    if v.message then
      text = text..'\nlast msg >\nmsg id = '..v.message.id
      if v.message.text then
        text = text .. "\n text = "..v.message.text
      end
      if v.message.action then
        text = text.."\n"..serpent.block(v.message.action, {comment=false})
      end
      if v.message.from then
        if v.message.from.print_name then
          text = text.."\n From > \n"..string.gsub(v.message.from.print_name, "_"," ").."["..v.message.from.id.."]"
        end
        if v.message.from.username then
          text = text.."( "..v.message.from.username.." )"
        end
        if v.message.from.phone then
          text = text.."' "..v.message.from.phone.." '"
        end
      end
    end
    text = text.."\n\n"
  end
  local file = io.open("dialoglist.txt", "w")
  file:write(text)
  file:flush()
  file:close()
  send_document("user#id"..cb_extra.target,"dialoglist.txt", ok_cb, false)--.txt format
  local file = io.open("dialoglist.json", "w")
  file:write(json:encode_pretty(result))
  file:flush()
  file:close()
  send_document("user#id"..cb_extra.target,"dialoglist.json", ok_cb, false)--json format
  end

 local function run(msg,matches)
    local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
    local group = msg.to.id
    if not is_admin(msg) then
    	return
    end
    
    if matches[1] "addcontact" then
      add_contact(matches[2], matches[3], matches[4],ok_cb,false)
     return "Added "..matches[2].." to contact list"
   end
   
   if matches[1] "recontact" then
     rename_conctact(matches[2],matches[3],matches[4],ok_cb,false)
     return "Contact "..matches[2].." Renamed"
   end
   
   if matches[1] "delcontact" then
     del_contact("user#id"..matches[2],ok_cb,false)
      return "User "..matches[2].." removed from Swatch Contact's"
   
   if matches[1] "contactlist" then
     get_contact_list(get_contact_list_callback, {target = msg.from.id})
       return "Sended Contactlist in your private\nPlease Check Your PV"
     end
     
     if matches[1] == "dialoglist" then
      get_dialog_list(get_dialog_list_callback, {target = msg.from.id})
      return "Sended dialoglist to Yuor Private\nPlease Check your PV"
    end
    
  if matches[1] == "res" then
    user_info("user#id"..matches[2],user_info_callback,{msg=msg})
  end
  return
end
return {
  patterns = {
    "^/(addcontact) (.*) (.*) (.*)$",
    "^/(recontact) (.*) (.*) (.*)$",
    "^/(delcontact) (%d+)$",
    "^/(contactlist)$",
    "^/(dialoglist)$",
    "^/(res) (%d+)$"
    },
  run = run,
}
--BY @ArashSWATCH
--I Think Your TG Will Crash But Plugin It's fix
   
