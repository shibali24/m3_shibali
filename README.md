Repo Link: https://github.com/shibali24/m3_shibali

# Concurrency Lyrics Video

Concurrency is about many things happening at once without breaking the system. I wanted the music itself to reflect that idea.

The base song is fully structured: consistent tempo, fixed lyrics, and a stable harmonic framework. On top of that, an improvisational layer runs concurrently. It preserves the beat and timing, but mutates instruments, timbres, and melodic gestures on each execution. The result mirrors concurrency in computer science: independent processes that share a clock, coordinate through constraints, and still behave unpredictably.

---

## Software Used

- **Synthesizer V Studio Pro**  
  Used to compose and record the vocal line, syllable by syllable, with careful control over pitch, timing, and expression.

- **Sonic Pi**  
  Used for all code based music generation. This includes both the static instrumental backing and the generative improvisation overlay written in Ruby.

- **GarageBand**  
  Used for light audio cleanup and balancing, since Synthesizer V did not provide sufficient tools for final audio polishing.

- **Vizzy (https://vizzy.io/)**  
  Used to create a low budget lyric music video.

- **Python with MoviePy**  
  Used to combine rendered audio with video, cut and freeze frames, and export final video files.

---

## Repository Contents

### Music and Code

- **`final_music.rb`**  
  A Sonic Pi script containing the static musical structure of the song. This includes the core beat, harmonic backing, and timing that aligns with the vocals.

- **`improv_overlay.rb`**  
  A Sonic Pi script that generates a new improvisational overlay every time it is run.  
  The script:
  - Locks to a fixed BPM and rhythmic grid so it stays synchronized with the base song
  - Cycles and shuffles instruments across runs
  - Uses probabilistic variation to alter timbre, note choice, and melodic fragments
  - Preserves overall musical coherence while ensuring no two executions sound identical  

  This script demonstrates algorithmic improvisation and concurrency through music.

- **`final_midi.mid`**  
  The MIDI file used as the foundation for the Synthesizer V vocal track. It shows the exact melodic and rhythmic structure used to build the final vocals.

- **`vocals.svp`**  
  The Synthesizer V Studio Pro project file containing the full vocal composition. Each syllable was manually adjusted, making this one of the most meticulous parts of the project.

  Note: Videos and audios in google drive link since they were too big
---

### Python Dependencies

- **`requirements.txt`**  

  This file includes MoviePy and the minimal set of supporting libraries required for video rendering and audio handling:

  - MoviePy for loading, cutting, freezing, and exporting video and audio
  - imageio and imageio-ffmpeg for media decoding through ffmpeg
  - NumPy for frame and audio array operations
  - decorator as required internally by MoviePy
  - tqdm and proglog for lightweight progress logging during video export

  These dependencies are sufficient to run the video processing script in a clean virtual environment. Using a virtual environment is recommended.

---

## Process Overview

This was one of the most challenging projects I have worked on because it required combining music theory, programming, and creative production into a single system.

I started by thinking carefully about song structure, emotional tone, and how scale choice, octave placement, and rhythm influence how upbeat and memorable a song feels. Once the concept was clear, I wrote the lyrics and composed the vocal line in Synthesizer V. Each syllable was placed and adjusted manually, which is reflected in the MIDI and project files.

In parallel, I wrote Sonic Pi code for the static instrumental backing so that it matched the phrasing and rhythm of the vocals. After that, I designed the improvisational overlay script. The goal was to keep tempo and structure fixed while allowing controlled randomness, so the improv layer behaves like a concurrent process rather than noise.

After producing the audio, I created a lyric video using Vizzy and then used Python and MoviePy to overlay audio and export final videos.

Sonic Pi does not support direct Python integration, so recording the improvisational overlays had to be done manually. Because of this, I saved three separate outputs from different executions of the same improv script rather than generating them programmatically.

---

## Output Videos and Audio Samples

The Google Drive folder below contains:

- One music video with no improvisational overlay
- Three music videos with algorithmic improv overlays
- The overlay audio files used for testing and recombination

Each improvised version comes from the same Sonic Pi script but sounds different due to probabilistic variation.

**Drive link:**  
https://drive.google.com/drive/folders/1iXk-cOKJRkHiZZWgJx-n6ILrSAuMl8r-

---

I hope you enjoy it and maybe learn something new about concurrency along the way :) 
