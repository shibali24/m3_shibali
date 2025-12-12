use_bpm 104
use_debug false

# stop everything after about a minute
duration = 110
set :start_time, vt

define :time_up? do
  vt - get(:start_time) >= duration
end

# background instruments get shuffled once per run
set :bg_instruments, [:pluck, :pretty_bell, :piano, :blade, :prophet].shuffle
set :bg_index, 0

define :next_bg_synth do
  synths = get(:bg_instruments)
  i = get(:bg_index)
  
  use_synth synths[i]
  
  set :bg_index, (i + 1) % synths.length
end

# shared beat state that can change without breaking rhythm
set :kick_sample, :bd_haus
set :hat_sample, :drum_cymbal_closed
set :hat_rate, 1.4
set :hat_amp, 0.2

# every 8 beats, change the sound but not the rhythm
live_loop :beat_mutation do
  stop if time_up?
  
  sleep 8
  
  set :kick_sample, [:bd_haus, :bd_tek, :bd_zum].choose
  set :hat_sample, [:drum_cymbal_closed, :drum_cymbal_pedal, :drum_cymbal_soft].choose
  set :hat_rate, rrand(1.2, 1.6)
  set :hat_amp, rrand(0.15, 0.25)
end

# steady kick that never drifts
live_loop :clock do
  stop if time_up?
  sample get(:kick_sample), amp: 0.6
  sleep 1
end

# steady hats with changing texture
live_loop :hat, sync: :clock do
  stop if time_up?
  sample get(:hat_sample),
    amp: get(:hat_amp),
    rate: get(:hat_rate)
  sleep 0.5
end

# melodic twinkles with shuffled instrument order
live_loop :twinkles, sync: :clock do
  stop if time_up?
  
  next_bg_synth
  use_synth_defaults amp: rrand(0.2, 0.45),
    release: rrand(0.2, 0.6)
  
  note_pool = scale(:g4, :major)
  
  if one_in(2)
    play note_pool.choose,
      pan: rrand(-0.7, 0.7)
  end
  
  sleep [0.25, 0.5, 1].choose
end

# glitchy sounds that feel like thread interference
live_loop :glitch, sync: :clock do
  stop if time_up?
  
  if one_in(4)
    sample [:elec_tick, :elec_blip, :elec_ping].choose,
      amp: rrand(0.15, 0.35),
      rate: rrand(0.8, 1.4)
  end
  
  sleep [0.25, 0.5, 1].choose
end

# rare freezes that represent deadlock
live_loop :deadlock do
  stop if time_up?
  
  if one_in(16)
    sample :elec_tick, amp: 0.4
    sleep 0.5
    sample :elec_tick, amp: 0.4
    sleep 0.5
    sleep 2
  end
  
  sleep 1
end

# busy looping sounds that represent livelock
live_loop :livelock do
  stop if time_up?
  
  if one_in(12)
    4.times do
      sample :elec_tick, amp: 0.2
      sleep 0.25
    end
  end
  
  sleep 1
end

# gentle ending cues near the end
live_loop :outro_fx do
  stop if time_up?
  
  if vt - get(:start_time) > duration - 16
    sample :elec_ping, amp: 0.25
    sleep 2
    sample :elec_blip2, amp: 0.3
    sleep 2
  else
    sleep 1
  end
end
