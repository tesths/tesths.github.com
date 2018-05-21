# 转换视频格式
# ./ffmpeg -i "wake1.mp4" wake.mkv

# 压制 srt 字幕
# ./ffmpeg -i in.mp4 -vf subtitles=xx.srt out.mp4

# 压制 ass 字幕
# ./ffmpeg -i wakemeup1.mp4 -vf "ass=wakemeup1.ass" wakemeup.mp4

#压制带 logo 的（logo 在上 ass 字幕在下）

# ./ffmpeg \
#     -i wakemeup1.mp4 \
#     -i logo-small.png \
#     -filter_complex \
#     "[0:v]ass=wakemeup1.ass[0v];\
#     [1:v]scale=200:100[img1];
#     [0v][img1]overlay=1060:70"\
#     -c:a copy final.mp4

#压制带 logo 的（ass 字幕在上 logo 在下）

# ./ffmpeg \
#     -i wakemeup1.mp4 \
#     -i logo-small.png \
#     -filter_complex \
#     "[1:v]scale=200:100[img1];\
#     [0:v][img1]overlay=1060:20[0v];\
#     [0v]ass=wakemeup1.ass"\
#     -c:a copy final.mp4

# 压制延迟出现 logo 的

# ./ffmpeg \
#     -i wakemeup1.mp4 \
#     -i logo-small.png \
#     -filter_complex \
#     "[1:v]scale=200:100[img1];\
#     [0:v][img1]overlay=1060:20:enable='between(t,35,6*60+30)'[0v];\
#     [0v]ass=wakemeup1.ass"\
#     -c:a copy final.mp4

# -filter_complex 
#  [1:v]scale=100:100[img1];
#  [2:v]scale=1280:720[img2];
#  [0:v][img1]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2[bkg];
#  [bkg][img2]overlay=0:0
