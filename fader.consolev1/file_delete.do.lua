local std = require("basic")

fileID = ctx():Get("file_id")
bucketID = ctx():FormValue("BucketID")

file = std.FindFile(fileID)

if file == nil then
    print("not found file by ID", fileID)
    ctx():NoContent(404)
    do return end
end


std.DeleteFile(fileID)

goTo = ctx():Route("cv1_ListFiles"):URLPath("bucket_id", bucketID)
ctx():Redirect(goTo)