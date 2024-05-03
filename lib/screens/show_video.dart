import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class ShowVideoScreen extends StatefulWidget {
  const ShowVideoScreen({Key? key}) : super(key: key);

  static const String routeName = '/show-video';

  @override
  _ShowVideoScreenState createState() => _ShowVideoScreenState();
}

class _ShowVideoScreenState extends State<ShowVideoScreen> {
  static const String _pathmu8 =
      "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fbo_gia.mp4?alt=media&token=7c89cb22-bffc-4721-91c4-144b6b7e19bc";
  late ChewieController _controller;
  late VideoPlayerController _videoPlayerController; // Thêm late ở đây

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(_pathmu8); // Không khai báo mới biến _videoPlayerController ở đây
    _controller = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      allowPlaybackSpeedChanging: true, // Kích hoạt tua video
      fullScreenByDefault: true,
    );
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.isInitialized && !_videoPlayerController.value.isPlaying) {
        // Nếu video đã được tải hoàn toàn và không phát, bắt đầu phát video
        _videoPlayerController.play();
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: 250,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Chewie(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
