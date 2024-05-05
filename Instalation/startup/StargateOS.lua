term.clear()
term.setCursorPos(1,1)
print("StargateOS (SGOS)")
print("Version: 0.7")
term.blit("By: Tycho10101","0000eeeee5d5d5","ffffffffffffff")
print("")
print("")
print("Awaiting input:")
term.blit("1 = StarLight DialUp","00004444444440000000","ffffffffffffffffffff")
print("")
print("2 = SG Music Player")
input = tonumber(io.read())
sleep(0)
if input == 1 then
    shell.run("SGOS/StarLight_DialUp.lua")
elseif input == 2 then
    shell.run("SGOS/music.lua")
else
    print("Invalid Option")
end
sleep(2)
shell.run("startup/StargateOS.lua")
