# Drum + Bass buffer


define :drum_short do
  in_thread(name: :drum_cym) do
    use_octave 0
    10.times do
      sample :drum_heavy_kick, amp: 0.4
      sample :drum_snare_soft, amp: 0.5
      sleep 2
    end
  end
end


define :drum_snare do
  in_thread(name: :drum_snare) do
    use_octave 0
    sleep 3
    31.times do
      sample :drum_bass_soft
      sleep 1
      sample :drum_snare_soft
      sample :drum_bass_soft
      sample :drum_heavy_kick, amp: 0.5
      sleep 1
    end
  end
end


define :bass do
  in_thread(name: :bass) do
    use_octave 0
    use_synth :beep
    use_synth_defaults note: 28, amp: 5
    4.times do
      4.times do
        play :Ds3, amp: 0.2
        sleep 1
      end
      4.times do
        play :B2, amp: 0.2
        sleep 1
      end
      4.times do
        play :Fs3, amp: 0.2
        sleep 1
      end
      4.times do
        play :Cs3, amp: 0.2
        sleep 1
      end
    end
  end
end
