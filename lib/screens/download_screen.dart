import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:open_file/open_file.dart';

import '../models/data_local/movie_model.dart';
import '../resources/app_color.dart';
import '../widgets/Base/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class DownLoadScreen extends StatefulWidget {
  const DownLoadScreen({Key? key}) : super(key: key);
  static const routeName = '/download_screen';

  @override
  State<DownLoadScreen> createState() => _DownLoadScreenState();
}

class _DownLoadScreenState extends State<DownLoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      resizeToAvoidBottomInset: true,
      body: GlobalLoaderOverlay(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: CustomAppBar(
                title: 'Download Movie',
                showBackButton: false,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listMovie.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => openFile(
                            url:
                                "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                            path: "video.mp4"),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.bgItem.withOpacity(1),
                          ),
                          height: 104,
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                  child: Image.asset(
                                'assets/images/image_download.png',
                                fit: BoxFit.cover,
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      listMovie[index].title ?? '',
                                      style: const TextStyle(
                                        color: AppColors.title,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          listMovie[index].value ?? '',
                                          style: const TextStyle(
                                            color: AppColors.value,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Image.asset(
                                          'assets/icons/ic_undownload.png',
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      listMovie[index].subValue ?? '',
                                      style: const TextStyle(
                                        color: AppColors.value,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  Future openFile({String? url, String? path}) async {
    context.loaderOverlay.show();
    final file = await _downloadFile(url: url ?? '', path: path ?? '');
    if (file == null) {
      return;
    } else {
      final snackBar = SnackBar(
        content: const Text('Download success'),
        duration: const Duration(seconds: 3),
        // Thời gian hiển thị Snackbar (3 giây)
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            // Code xử lý khi nhấn vào action
          },
        ),
      );

      // Hiển thị Snackbar
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      OpenFile.open(file.path);
      context.loaderOverlay.hide();
    }
  }

  Future<File?> _downloadFile(
      {required String url, required String path}) async {
    // setState(() {
    //   _downloading = true;
    // });

    try {
      var response = await http.get(Uri.parse(url));
      final Directory directory = Directory('/storage/emulated/0/Download');
      // await getApplicationDocumentsDirectory();

      //  String fileName = url.substring(url.lastIndexOf('/') + 1);
      String filePath = '${directory.path}/$path';
      final file = File(filePath);
      // var response = await Dio().get(url,
      //     options: Options(
      //         responseType: ResponseType.bytes,
      //         followRedirects: false,
      //         receiveTimeout: const Duration(minutes: 0)));

      // final raf = file.openSync(mode: FileMode.write);
      // raf.writeByteSync(response.data);
      // await raf.close();
      print('Downloaded image to: $filePath');
      return await file.writeAsBytes(response.bodyBytes);

      // return file;
    } catch (e) {
      print('Error downloading file: $e');
      // setState(() {
      //   _downloading = false;
      // });
    }
  }
}
