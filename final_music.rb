use_bpm 104
use_synth :prophet
define :hook do
  sleep 0.5 
  play :g4 
  sleep 0.5
  play :a4 
  sleep 1
  play :g4 
  sleep 0.5
  play :a4 
  sleep 1
  
  play :e4
  sleep 0.5
  play :c4
  sleep 0.5
  play :d4
  sleep 0.5
  play :e4
  sleep 0.5
  
  play :f4
  sleep 0.5
  play :g4
  sleep 0.5
  play :a4
  sleep 1
end


define :verse1 do
  use_synth :piano
  
  ### "New work starting up again,"
  notes = [:g4, :a4, :b4, :a4, :g4, :a4, :b4]
  notes.each_with_index do |n,i|
    play n
    sleep (i == 6 ? 1 : 0.5)
  end
  
  ### "Both of us racing for the win."
  notes = [:a4, :b4, :a4, :g4, :a4, :b4, :c5]
  notes.each_with_index do |n,i|
    play n
    sleep (i == 6 ? 1 : 0.5)
  end
  
  ### "Switching, swapping — fast or slow,"
  notes = [:g4, :a4, :b4, :a4, :g4, :a4, :b4]
  notes.each_with_index do |n,i|
    play n
    sleep (i == 6 ? 1 : 0.5)
  end
  
  ### "Concurrency helps us both go!"
  notes = [:b4, :a4, :g4, :a4, :b4, :c5, :d5]
  notes.each_with_index do |n,i|
    play n
    sleep (i == 6 ? 1 : 0.5)
  end
end


define :verse2 do
  use_synth :piano
  
  ### "Deadlock hits when we both freeze,"
  notes = [:g4, :a4, :b4, :a4, :g4, :a4, :b4]
  notes.each_with_index do |n,i|
    play n
    sleep (i==6 ? 1 : 0.5)
  end
  
  ### "Neither moves — we lose the keys."
  notes = [:a4, :b4, :c5, :b4, :a4, :g4, :a4]
  notes.each_with_index do |n,i|
    play n
    sleep (i==6 ? 1 : 0.5)
  end
  
  ### "Livelock’s dancing in a loop,"
  notes = [:g4, :a4, :b4, :a4, :b4, :c5, :b4]
  notes.each_with_index do |n,i|
    play n
    sleep (i==6 ? 1 : 0.5)
  end
  
  ### "Trying hard but still we go swoop."
  notes = [:a4, :b4, :c5, :b4, :a4, :g4, :a4]
  notes.each_with_index do |n,i|
    play n
    sleep (i==6 ? 1 : 0.5)
  end
  
  ### "Two threads racing just to win,"
  notes = [:g4, :a4, :b4, :a4, :g4, :a4, :b4]
  notes.each_with_index do |n,i|
    play n
    sleep (i==6 ? 1 : 0.5)
  end
  
  ### "Wrong order changes everything."
  notes = [:a4, :b4, :c5, :b4, :a4, :g4, :a4]
  notes.each_with_index do |n,i|
    play n
    sleep (i==6 ? 1 : 0.5)
  end
  
  ### "Shared data shifting out of line,"
  notes = [:g4, :a4, :b4, :a4, :g4, :a4, :b4]
  notes.each_with_index do |n,i|
    play n
    sleep (i==6 ? 1 : 0.5)
  end
  
  ### "That's what happens at runtime!"
  notes = [:b4, :a4, :g4, :a4, :b4, :c5, :d5]
  notes.each_with_index do |n,i|
    play n
    sleep (i==6 ? 1 : 0.5)
  end
end

