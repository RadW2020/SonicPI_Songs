#### Blue Monday Cover ####

# base loop
define :base do |num|
  num *= 2
  num.times do
    6.times do
      sample :bd_haus , amp: 2
      sleep 0.5
    end
    
    8.times do
      sample :bd_haus, cutoff: 120, amp: 2
      sleep 0.125
    end
  end
end

# melody loop
define :melodia do |num|
  num.times do
    notes = (ring :F3, :F2, :F3, :F2, :C3, :C2, :C3, :C2, :D3, :D2, :D3, :D2, :D3, :D2, :D3, :D2, :G3, :G2, :G3, :G2, :C3, :C2,:C3, :C2, :D3, :D2, :D3, :D2, :D3, :D2, :D3, :D2 )
    use_synth :chiplead
    use_synth_defaults amp: 0.7, attack: 0.01, sustain: 0.15, release: 0.125, cutoff: 70
    notes.each do |n|
      play note(n)
      sleep 0.25
    end
  end
end

# kick snare loop
define :tumpa do |num|
  num = num * 8
  num.times do
    sample :drum_heavy_kick
    sleep 0.5
    sample :drum_snare_hard , amp: 2
    sleep 0.5
  end
end

#TODO main melody

# break
define :stahp do |num|
  num.times do
    4.times do
      sample :drum_snare_hard, amp: 2
      sleep 0.25
    end
    sleep 0.25
  end
end


########### SONG #############
## Times are normalized to 8 seconds

in_thread do
  base 8
end

in_thread delay: 16 do
  melodia 6
end

in_thread delay: 32 do
  tumpa 4
end

sleep 64
stahp 2

in_thread delay: 66 do
  tumpa 4
end






