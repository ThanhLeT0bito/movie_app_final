import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class ShowVideoScreen extends StatefulWidget {
  const ShowVideoScreen({super.key});
  static const routeName='/show_video';

  @override
  State<ShowVideoScreen> createState() => _ShowVideoScreenState();
}

class _ShowVideoScreenState extends State<ShowVideoScreen> {
  static const String _pathmu8 =
      // "https://imdb-video.media-imdb.com/vi1015463705/1434659379400-8cjq25-1606954080073.mp4?Expires=1708835516&Signature=f~TeLiAbTk~x2vN0K3C4r-e-8ldLMV8owfIBvNgr~Qx1acRvkCbWaxS-g~J3UMJQZRHK1qI7hIMyRWkEJf1hZT3LVA-gQOKFpqh-dPITjmCzQ5fLnKEc9XSZaF2Ms66hk3P2~H6DyijIDwX1MFObDUSqnMQ1P~TnhQb4hiw~vxCO58X3cOjUh0GhsCYOiBMdQFzBHcCCORm-GMAeEOnTwU77ncISTilAkOhpySIOwGWDmBEDsjPfnAXAOeUBJHsYfOPL5fU5ALJwC5m7te0UXVHZr6Y44TJqHsoNjan9XF6IQmckwQnvrMM2ZEvgQd6AdrATI3Ne1t7Cy~~3gKfyrA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA";
      "https://imdb-video.media-imdb.com/vi1015463705/hls-preview-b76ce5d6-075e-4e6d-b83b-97ed40917555.m3u8?Expires=1708880280&Signature=kmmtZ6dobAI6AiYiKN-chMddC-t51Qvt2ksXGsy0wqGn-A3QjpH8Nv2~73y-v18voT41xeGCYwzxpj3ExY2w2c4yUioLPZ6FRtD9IoYXc~yDB7cF0Q-lhyYCq-VU16d5KelulFYjBiBLoOFC~-oiXSsK9WF-GnF2FA92JuH4nED6EnKkss5u-Y~RB1LiwF6teNL3bmluDEtQy0Z8QV3ZOi744fJXMLvFQ1W1gc2W2PY1VPjj1sxk194qhnfuTmPMEyv8RnOL2BuIEXK0D13c~nJr-qH2OBm5N4HyeiwEFTiSshZEvQQKzj2uxY~F2Ajrn93TA0llFBsH~NkV99yVcA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA";
  //"https://imdb-video.media-imdb.com/vi1015463705/hls-1606954080073-master.m3u8?Expires=1708886133&Signature=Az0VIw~iONFakT8TK9tkfb2ZX0e1ZgYEr3nWOsuV1Jg-WmQZB~fXJCPizjJnP~FZQ4TAbFM7YAwF6kEAT5H9rSTeFbSHF6KUHDTEi1u~nV8fI7UC9xZFWYmcPJDiRLYmTT1WidvnB1u6a7HzheHQZlQsHIQuCaFd7C8yWEYjvS0Ywwi4wAReOmCTIKo-30jf1WG5fOl~0r7QE285ahj8GybilvbMKC-uTtYfqPwyE7M-6ykqbKH0~pAicGJD2TC1j1qos5q~R1-8pXB4wp9LsM3HS50YMVMlQ7lgsWvXietfM0PcsPR0dMhx6JtQfrxT07xCkb7oKYMnNcbt0-xUvw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA";
  //"https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2F274309133_129320749606352_5585458166913061394_n.mp4?alt=media&token=81cce395-d884-49e1-893b-83ee4b85c6da";
  //"https://firebasestorage.googleapis.com/v0/b/demoapp-7726b.appspot.com/o/video%2F260855073_501014027629498_7685784845870597137_n.m3u8?alt=media&token=e0ebf695-e702-4b12-96b8-d406dd6ed45b";
  //"https://firebasestorage.googleapis.com/v0/b/demoapp-7726b.appspot.com/o/video%2F274309133_129320749606352_5585458166913061394_n.mp4?alt=media&token=f2925097-a4a0-47bd-8173-c3ad940b2008";
  final ChewieController _controller = ChewieController(
    // ignore: deprecated_member_use
    videoPlayerController: VideoPlayerController.network(_pathmu8),
    aspectRatio: 16 / 9,
    //aspectRatio: null,
    autoPlay: true,
    looping: true,
    fullScreenByDefault: true,

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Video Player'),
        ),
        body: Container(
          height: 250,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Chewie(
            controller: _controller,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          
          onPressed: () {
            setState(() {
              if (_controller.videoPlayerController.value.isPlaying) {
                _controller.videoPlayerController.pause();
              } else {
                _controller.videoPlayerController.play();
              }
            });
          },
          child: Icon(_controller.videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow),
        ));
  }
}
