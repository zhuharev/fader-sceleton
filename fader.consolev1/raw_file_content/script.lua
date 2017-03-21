local std = require("basic")

fileID = ctx():Get("file_id")

--
-- main
--

file = std.FindFile(fileID)

if file == nil then
	ctx():NoContext(404)
	do return end
end

-- TODO: https://github.com/inpime/fader/blob/master/addons/filestatic/handlers.go#L81

ctx():FileContent(200, file)