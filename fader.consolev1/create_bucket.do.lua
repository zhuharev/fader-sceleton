local std = require("basic")

ok = std.CreateBucket(ctx():FormValue("BucketName"))

if not ok then
    -- TODO: handler error
end

goTo = ctx():Route("cv1_ListBuckets"):URLPath()
ctx():Redirect(goTo)