term.clear()
term.setCursorPos(1, 1)
interface = peripheral.find("advanced_crystal_interface")

function dial(address)

    local addressLength = #address
    local start = interface.getChevronsEngaged() + 1
    
    for chevron = start,addressLength,1
    do
        local symbol = address[chevron]
        
        if chevron % 2 == 0 then
            interface.rotateClockwise(symbol)
        else
            interface.rotateAntiClockwise(symbol)
        end
        
        while(not interface.isCurrentSymbol(symbol))
        do
            sleep(0)
        end
        
        sleep(1)
        interface.openChevron()
        sleep(1)
        interface.closeChevron()
        sleep(1)
    end
end

netherAddress = {27,23,4,34,12,28,0}
testAddress = {18,3,10,13,27,2,32,5,0}

term.blit("Tycho10101's StarLight DialUp","eeeee5d5d50004444444440000000","fffffffffffffffffffffffffffff")
print("")
print("")
print("Awaiting input:")
print("0 = Go Back")
print("1 = Nether")
print("2 = test")
input = tonumber(io.read())
sleep(0)
print("")
if input == 0 then
    print("Going Back")
elseif input == 1 then
    print("Dialing Nether")
    dial(netherAddress)
    print("Dialing Finished")
elseif input == 2 then
    print("Dialing test")
    dial(testAddress)
    print("Dialing Finished")
else
    print("Invalid input")
end
sleep(2)
shell.run("startup/StargateOS.lua")
