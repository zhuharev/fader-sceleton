local std = require("basic")
s = Session.empty()

std.MemoryGet("sessions:generate", s)

if s:IsEmpty() then
    print("is empty, create new session")
    s:CreateForUser()
end

print("SessionID", s:SessionID())
print("UserID", s:UserID())

c = s:Get("counter")
if c == nil then
    c = 0
end

c = c + 1
s:Set("counter", c)
print("Counter", c)


if c == 10 then
    std.MemoryDel("sessions:generate")
else
    std.MemorySet("sessions:generate", s)
end

ctx():NoContent(200);

do return end