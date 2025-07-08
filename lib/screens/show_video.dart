import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/models/movie_model.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class ShowVideoScreen extends StatefulWidget {
  ShowVideoScreen(
      {super.key,
      required this.movie,
      this.startAt = Duration.zero,
      this.onVideoPositionChanged});
  static const routeName = '/show_video';
  final MovieModel movie;
  Duration startAt;
  final Function(Duration)? onVideoPositionChanged;

  @override
  State<ShowVideoScreen> createState() => _ShowVideoScreenState();
}

class _ShowVideoScreenState extends State<ShowVideoScreen> {
  late final VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.movie.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      startAt: widget.startAt,
    );
  }

  @override
  void dispose() {
    widget.startAt = _videoPlayerController.value.position;
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    widget.onVideoPositionChanged!(widget.startAt);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: _chewieController != null
          ? Chewie(controller: _chewieController!)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
