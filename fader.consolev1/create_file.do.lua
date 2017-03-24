local std = require("basic")

bucketID = ctx():Get("bucket_id")
-- TODO: validation

-- создание файла по имени
newFile = File:new()
newFile:SetBucketID(bucketID)
newFile:SetFileName(ctx():FormValue("FileName"))

ok = std.CreateFile(newFile)

if not ok then
    -- TODO: handler error
end

goTo = ctx():Route("cv1_EditFile"):URLPath("file_id", newFile:FileID())
ctx():Redirect(goTo)