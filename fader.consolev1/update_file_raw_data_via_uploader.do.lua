local std = require("basic")

fileID = ctx():Get("file_id")
fileInfo = ctx():FormFile("file")

-- TODO: validation
file = std.FindFile(fileID)

if file == nil then
	ctx():NoContext(404)
	do return end
end

file:SetRawDataFromFile(fileInfo)

mode = std.RawData
mode:Add(std.PrimaryNamesData)
mode:Add(std.ContentTypeData)
ok = std.UpdateFileFrom(file, mode)

if not ok then
	-- TODO: error handler
	print("Error update file", fileID)
	ctx():NoContext(400)
	do return end
end

goTo = ctx():Route("cv1_EditFile"):URLPath("file_id", fileID)
ctx():Redirect(goTo)