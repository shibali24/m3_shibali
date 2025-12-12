# Concurrency in Sound  
**CSCI 3725 · Educational Music Video**

This project aims to teach **race conditions, deadlock, locking, and synchronization** with music in **Sonic Pi** and **Synthesizer Pro**. Two voices act as concurrent threads. Their timing conflicts, overlaps, freezes, and recovery *are* the system.

---

## Musical Core

The piece runs at **108 BPM** and uses two voices throughout:

- **Piano** → Thread A  
- **Pretty Bell (flute)** → Thread B  

They share the same pitch space and compete for timing. The recurring hook restates the full system:
piano: C4 → G4 → A4 → E4
bell: E4 → C5 → G4 → C4

**two threads → one core → lock → release → restore**

## System States in Sound

- **Out of Sync** – staggered entrances, offset phrasing  
- **Race Condition** – tight overlaps, fast interruptions  
- **Deadlock** – long sustained notes, no forward motion  
- **Lock & Recovery** – lock sounds  
- **Synchronized Execution** – harmonious

## Synthesizer for Vocals

I wrote the lyrics for each action and made the vocals in **Synthesizer** to lock lyric timing to exact note events generated Sonic Pi. This keeps:

- syllables aligned with thread timing
- aims to teach concurrency

