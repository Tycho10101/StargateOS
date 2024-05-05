print("Awaiting input:")
print("0 = Go Back")
print("1 = Stargate SG-1")
input = tonumber(io.read())
sleep(0)
print("")
if input == 0 then
    print("Going Back")
elseif input == 1 then
    local dfpwm = require("cc.audio.dfpwm")
    local speaker = peripheral.find("speaker")

    print("Playing Stargate SG-1")
    local decoder = dfpwm.make_decoder()
    for chunk in io.lines("SGOS/data/Stargate1.dfpwm", 16 * 1024) do
        local buffer = decoder(chunk)
    
        while not speaker.playAudio(buffer) do
            os.pullEvent("speaker_audio_empty")
        end
    end
    sleep(5)
    print("Finished Stargate SG-1")
else
print("Invalid Option")
end
sleep(2)
shell.run("startup/StargateOS.lua")
