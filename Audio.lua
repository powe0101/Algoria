function PlayAudio(_string,_pitch,_volume,_loop)
    bgCheck = true
    if bgMusic then
      love.audio.stop(bgMusic)
    end
    bgMusic = love.audio.newSource(_string)
    love.audio.setVolume(_volume)
    love.audio.play(bgMusic)
    bgMusic:setLooping(_loop)
    bgMusic:setPitch(_pitch)
    print(bgMusic:getPitch())
end
