
local basic = require("basic")
bucket = basic.FindBucket(ctx():Get("bucket_id"))
ctx():Set("CurrentBucketName", bucket:BucketName())
