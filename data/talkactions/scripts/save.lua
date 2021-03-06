local savingEvent = 0

function onSay(player, words, param)
	if player:getGroup():getAccess() then
		if isNumber(param) then
			stopEvent(savingEvent)
			save(tonumber(param) * 60 * 1000)
		else
			saveServer()
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Server saved.")
		end
	end
end

function save(delay)
	saveServer()
	if delay > 0 then
		savingEvent = addEvent(save, delay, delay)
	end
end
