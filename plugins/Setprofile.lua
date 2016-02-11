local function set_profile_name(msg, success, result)
local name = matches[2]
set_profile_name(name, ok_cb, false)
return "Name Changed to "..matches[2]"
end
return {
discription = "Changing bot name",
usage = "/setprofile (value) : Set Bot Name",
patterns = {
"^/setprofile (.*)$",
},
run = run
}
