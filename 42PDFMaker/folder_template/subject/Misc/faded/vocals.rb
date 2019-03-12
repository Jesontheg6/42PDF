# Vocals buffer
define :fm_piano do
  in_thread(name: :fm_piano) do
    use_synth :fm
    use_synth_defaults amp: 0.3
    with_fx :reverb do
      measure1 = [[:Ds5, :As4, :Ds4], [:Ds5, :As4, :Ds4], [:Ds5, :As4, :Ds4], [:Cs5, :As4, :Cs4]]
      measure2 = [[:B4, :Fs4, :B3], [:Ds5, :Ds4, :B3], [:Ds5, :Ds4, :B3], [:Cs5, :Cs4, :B3]]
      measure3 = [[:Cs5, :Fs4, :Cs4], [:Cs5, :Fs4, :Cs4], [:Cs5, :Fs4, :Cs4], [:Cs5, :Fs4, :Cs4]]
      measure4 = [[:Cs5, :Gs4, :Cs4], [:Cs5, :Gs4, :Cs4], [:Cs5, :Gs4, :Cs4], [:Cs5, :Gs4, :Cs4]]
      
      2.times do
        measure1.each do |m|
          play m
          sleep 1
        end
        measure2.each do |m|
          play m
          sleep 1
        end
        measure3.each do |m|
          play m
          sleep 1
        end
        measure4.each do |m|
          play m
          sleep 1
        end
      end
    end
  end
  vocal_piano
end

define :vocal_piano do
  use_synth :piano
  use_octave -2
  with_fx :reverb, room: 0.8 do
    measure1 = [:Fs7, :Fs7, :Ds7, :Fs7, :Ds7, :Fs7, :Gs7]
    timing1 = [0.5, 0.5, 0.5, 0.5]
    measure2 = [:As7, :Fs7, :Fs7, :Cs7, :As7]
    timing2 = [1, 0.5, 0.5, 0.5, 1]
    measure4 = [:F7, :F7, :Ds7, :Fs7]
    measure6 = [:As7, :Fs7, :Fs7, :Cs8, :As7]
    
    measure1.each do |m|
      play m
      sleep 0.5
    end
    measure2.zip(timing2).each do |m, t|
      play m
      sleep t
    end
    sleep 2.5
    2.times do
      play :Fs7
      sleep 0.5
    end
    play :F7
    sleep 0.5
    play :F7
    sleep 2
    measure4.each do |m|
      play m
      sleep 0.5
    end
    sleep 1
    measure1.each do |m|
      play m
      sleep 0.5
    end
    measure6.zip(timing2).each do |m, t|
      play m
      sleep t
    end
    sleep 2
    2.times do
      play :Fs7
      sleep 0.5
    end
    play :Gs7
    sleep 4
    3.times do
      play :As7
      sleep 0.5
    end
  end
  vocal_piano2
end

define :vocal_piano2 do
  in_thread(name: :vocal_piano2) do
    with_fx :reverb, room: 0.8 do
      measure1 = [:Fs7, :Gs7, :Gs7, :Gs7, :Gs7, :Fs7, :Fs7]
      timing1 = [0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5]
      release1 = [0.5, 0.5, 1, 1, 1, 1, 1]
      measure2 = [:Fs7, :Fs7, :Fs7, :Gs7, :F7, :F7, :F7, :Fs7]
      timing2 = [0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5]
      release2 = [0.5, 0.5, 1, 1, 1, 1, 1, 1]
      
      play :As7
      sleep 6
      4.times do
        play :As7
        sleep 0.5
      end
      sleep 5
      4.times do
        play :As7
        sleep 0.5
      end
      sample :drum_heavy_kick, amp: 0.4
      sample :drum_cymbal_open, amp: 0.1
      sleep 1
      drum_short
      measure1.zip(timing1, release1) do |m, t, r|
        play m, release: r
        sleep t
      end
      sleep 4
      4.times do
        play :As7
        sleep 0.5
      end
      sleep 1
      measure2.zip(timing2, release2) do |m, t, r|
        play m, release: r
        sleep t
      end
      sleep 4
      4.times do
        play :As7
        sleep 0.5
      end
    end
  end
  guitar
  
end



