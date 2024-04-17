import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoContainer extends StatefulWidget {
  final String videoUrl;
  const VideoContainer({super.key, required this.videoUrl});

  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/video/test.mov',
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: true
      )

    )
      ..initialize().then((_) {
        // Ensure that the state is mounted before calling setState
        if (mounted) {
          setState(() {}); // Update the state to rebuild the UI
        }
      });

    _controller.addListener(_videoListener);
  }

  void _videoListener() {
    if (_controller.value.position >= _controller.value.duration) {

      print('Video has ended');
    }
  }
  String _formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(_videoListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [


        ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, VideoPlayerValue value, child) {
            if (!value.hasError && value.duration.inMilliseconds != 0) {
              double progressValue = value.position.inMilliseconds.toDouble() /
                  value.duration.inMilliseconds.toDouble();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(_formatDuration(value.position)),
                  //     Text(_formatDuration(value.duration)),
                  //   ],
                  // ),
                  // Add some spacing between the text and the indicator
                  LinearProgressIndicator(
                    value: progressValue.isFinite ? progressValue : 0.0,
                    minHeight: 3,
                    backgroundColor: Colors.grey[300], // Background color of the progress bar
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent.withAlpha(150)), // Color of the progress bar
                  ),
                ],
              );
            } else {
              return Container(); // Return an empty container if duration is not available
            }
          },
        ),
        SizedBox(height: 6),

        Container(
          height: 200,
          padding: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: 2,

                  child: VideoPlayer(_controller
                  ),
                )
                    : Image.asset(
                  ImagesManager.appLogo,
                  fit: BoxFit.cover,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    size: 50,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}
