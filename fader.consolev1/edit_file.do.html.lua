
local std = require("basic")

fileID = ctx():Get("file_id")
cmd = ctx():Get("cmd")

--
-- main
--

file = std.FindFile(fileID)

if file == nil then
	ctx():NoContext(404)
end

if cmd == "cmd_update_structural_from_console" then
    structuralDataJSON = ctx():FormValue("StructuralData")
    
    file:SetStructuralDataFromStrJSON(structuralDataJSON)
    
    ok = std.UpdateFileFrom(file, std.StructuralData)
    
    if not ok then
		-- TODO: error handler
	end
	
	goTo = ctx():Route("cv1_EditFile"):URLPath("file_id", file:FileID())
	ctx():Redirect(goTo)
	do return end
end


-- обновление типа контента
if cmd == "update_content_type" then
    contentType = ctx():FormValue("ContentType")
    
    file:SetContentType(contentType)
    
    ok = std.UpdateFileFrom(file, std.ContentTypeData)

	if not ok then
		-- TODO: error handler
	end
	
	goTo = ctx():Route("cv1_EditFile"):URLPath("file_id", file:FileID())
	ctx():Redirect(goTo)
	do return end
end


-- обновление имени у файла
if cmd == "update_name" then
	newName = ctx():FormValue("FileName")
	-- TODO: validation

	file:SetFileName(newName)
	ok = std.UpdateFileFrom(file, std.PrimaryNamesData)

	if not ok then
		-- TODO: error handler
	end
	
	goTo = ctx():Route("cv1_EditFile"):URLPath("file_id", file:FileID())
	ctx():Redirect(goTo)
	do return end
end 

-- обновление контента с формы редактирования файла
if cmd == "update_content_from_console" then
	rawDataStr = ctx():FormValue("RawDataString")
	-- TODO: validation

	file:SetRawData(rawDataStr)

	ok = std.UpdateFileFrom(file, std.RawData)

	if not ok then
		-- TODO: error handler
	end
	
	goTo = ctx():Route("cv1_EditFile"):URLPath("file_id", file:FileID())
	ctx():Redirect(goTo)
	do return end
end 

-- обновление lua с формы редактирования файла
if cmd == "update_lua_from_console" then
	luaScript = ctx():FormValue("LuaScript")
	-- TODO: validation

	file:SetLuaScript(luaScript)

	ok = std.UpdateFileFrom(file, std.LuaScript)

	if not ok then
		-- TODO: error handler
	end
	
	goTo = ctx():Route("cv1_EditFile"):URLPath("file_id", file:FileID())
	ctx():Redirect(goTo)
	do return end
end 

