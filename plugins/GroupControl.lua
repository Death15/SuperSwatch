local function run(msg)
  if not is_sudo(msg) then
    return nil
    end
    if msg.text "!add supergroup" then
    return 'Group is already added.'
  end
  end
  return {
  patterns = {
  "^[!/](add) (supergroup)$",
  },
  run = run
  }
  end
