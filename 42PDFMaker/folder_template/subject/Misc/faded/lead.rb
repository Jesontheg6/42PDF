#Lead Buffer
# Measure 1 - 8
define :lead do
  use_synth :prophet
  use_synth_defaults  amp: 0.5
  with_fx :reverb, room: 0.8 do
    measure1 = [:Fs5, :Fs5, :Fs5, :Fs5, :Fs5, :Fs5, :Fs5, :As5, :As5, :As5]
    release1 = [1, 1, 1, 1, 1, 1, 0.5, 1, 0.5, 1]
    timing1 = [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25]
    measure2 = [:Ds6, :Ds6, :Ds6, :Ds6, :Ds6, :Ds6, :Cs6, :Cs6]
    
    2.times do
      measure1.zip(timing1, release1).each do |m, t, r|
        play m, release: r
        sleep t
      end
      measure2.each do |m|
        play m
        sleep 0.5
      end
      timing1.each do |t|
        play :As5
        sleep t
      end
      8.times do
        play :F5
        sleep 0.5
      end
    end
  end
  lead9_to_11
end

define :lead9_to_11 do
  use_synth :prophet
  use_synth_defaults amp: 0.5
  with_fx :reverb, room: 0.8  do
    measure9 = [:Fs5, :Fs5, :Fs5, :Fs5, :AS5, :As5, :Fs6, :Fs6, :F6, :F6]
    release9 = [1, 1, 1, 1, 1, 0.5, 1, 1, 1]
    timing9 = [0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 0.25, 0.25, 0.25]
    measure10 = [:Ds6, :Ds6, :Ds6, :Cs6, :Cs6, :Cs6, :Gs5, :Gs5]
    measure11 = [:As5, :As5, :As5, :As5, :Cs6, :B5, :As5, :Gs5, :Fs5, :F5]
    release11 = [1, 1, 1, 1, 1, 0.5, 0.25, 0.5, 0.5, 0.5]
    timing11 = [0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25]
    
    measure9.zip(timing9, release9).each do |m, t, r|
      play m, release: r
      sleep t
    end
    measure10.each do |m|
      play m
      sleep 0.5
    end
    measure11.zip(timing11, release11).each do |m, t, r|
      play m, release: r
      sleep t
    end
  end
end

define :lead12_to_16 do
  use_synth :prophet
  use_synth_defaults amp: 0.5
  with_fx :reverb, room: 0.8 do
    measure12 = [:F5, :F5, :F5, :F5, :Gs5, :F5]
    release12 = [1, 1, 1, 1, 2, 2]
    timing12 = [0.5, 0.5, 0.5, 0.5, 1, 1]
    measure16 = [:F5, :F5, :F5, :F5, :Fs5, :Gs5, :Fs5]
    release16 = [1, 1, 1, 1, 2, 1, 1]
    timing16 =  [0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5]
    measure12.zip(timing12, release12).each do |m, t, r|
      play m, release: r
      sleep t
    end
    lead9_to_11
    measure16.zip(timing16, release16).each do |m, t, r|
      play m, release: r
      sleep t
    end
  end
end


define :start_lead do
  use_octave 0
  sleep 1
  drum_snare
  sleep 2
  bass
  lead
  lead12_to_16
end
















