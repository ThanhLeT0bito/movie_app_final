import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/models/movie_model.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class ShowVideoScreen extends StatefulWidget {
  const ShowVideoScreen({super.key, required this.movie});
  static const routeName = '/show_video';
  final MovieModel movie;

  @override
  State<ShowVideoScreen> createState() => _ShowVideoScreenState();
}

class _ShowVideoScreenState extends State<ShowVideoScreen> {
  static const String _pathmu8 =
      "https://imdb-video.media-imdb.com/vi1015463705/hls-preview-b76ce5d6-075e-4e6d-b83b-97ed40917555.m3u8?Expires=1708880280&Signature=kmmtZ6dobAI6AiYiKN-chMddC-t51Qvt2ksXGsy0wqGn-A3QjpH8Nv2~73y-v18voT41xeGCYwzxpj3ExY2w2c4yUioLPZ6FRtD9IoYXc~yDB7cF0Q-lhyYCq-VU16d5KelulFYjBiBLoOFC~-oiXSsK9WF-GnF2FA92JuH4nED6EnKkss5u-Y~RB1LiwF6teNL3bmluDEtQy0Z8QV3ZOi744fJXMLvFQ1W1gc2W2PY1VPjj1sxk194qhnfuTmPMEyv8RnOL2BuIEXK0D13c~nJr-qH2OBm5N4HyeiwEFTiSshZEvQQKzj2uxY~F2Ajrn93TA0llFBsH~NkV99yVcA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA";
  // final ChewieController _controller = ChewieController(
  //   // ignore: deprecated_member_use
  //   videoPlayerController: VideoPlayerController.network(widget.movie.videoUrl),
  //   aspectRatio: 16 / 9,
  //   //aspectRatio: null,
  //   autoPlay: true,
  //   looping: true,
  //   //fullScreenByDefault: true,
  // );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Chewie(
        controller: ChewieController(
          // ignore: deprecated_member_use
          videoPlayerController:
              VideoPlayerController.network(widget.movie.videoUrl),
          aspectRatio: 16 / 9,
          //aspectRatio: null,
          autoPlay: true,
          looping: true,
          //fullScreenByDefault: true,
        ),
      ),
    );
  }
}
