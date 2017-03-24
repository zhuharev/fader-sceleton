
local std = require("basic")

file = std.FindFile(ctx():Get("file_id"))
bucketOfFile = std.FindBucket(file:BucketID())

ctx():Set("BucketName", bucketOfFile:BucketName())
ctx():Set("File", file)
