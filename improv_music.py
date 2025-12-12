from moviepy import (
    VideoFileClip,
    AudioFileClip,
    CompositeAudioClip,
    concatenate_videoclips,
)
import os

target_duration = 60  # seconds


# load the lyric video (no improv)
video = VideoFileClip("lyric_video_noimprov.mp4")

# if the video is longer than target_duration, cut it
if video.duration >= target_duration:
    video = video.subclipped(0, target_duration)

# if the video is shorter, freeze the last frame
else:
    freeze_time = target_duration - video.duration
    last_frame = video.to_ImageClip(duration=freeze_time)
    video = concatenate_videoclips([video, last_frame])


# load audio tracks
base_music = AudioFileClip("Final_full_version.mp3")
improv_audio_path = "overlay_audio_v3.wav"
improv_audio = AudioFileClip(improv_audio_path)

# hard cut audio to target_duration
base_music = base_music.subclipped(0, min(target_duration, base_music.duration))
improv_audio = improv_audio.subclipped(0, min(target_duration, improv_audio.duration))


# mix the base music with the improv overlay
final_audio = CompositeAudioClip(
    [
        base_music.with_volume_scaled(1.0),
        improv_audio.with_volume_scaled(0.8),
    ]
).with_duration(target_duration)

video = video.with_audio(final_audio)


# build output filename from overlay audio name
overlay_name = os.path.splitext(os.path.basename(improv_audio_path))[0]
output_filename = f"{overlay_name}_music_video.mp4"


# export final video
video.write_videofile(
    output_filename,
    fps=24,
    codec="libx264",
    audio_codec="aac",
)

print(f"final music video exported as {output_filename}")
