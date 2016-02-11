local function channel_get_admins(admins, channel_id)
local channel = msg.to.id
local chan = ("%s#id%s"):format(msg.to.type, msg.to.id)
if msg.to.type == 'channel' then
        channel_get_admins(chan, channelAdminIDs, {receiver=receiver})
        end
        return {
  description = "get Supergroup Admins.",
  usage = {
    "/adminslist : get Supergroup Admins",
  },
  patterns = {
    "^/adminslist$",
  },
  run = run
}
