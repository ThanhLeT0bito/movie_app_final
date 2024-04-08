import 'package:flutter/material.dart';
import '../models/episode.dart';
import '../providers/episode_provider.dart';
import '../resources/app_color.dart';

class ListWidget extends StatefulWidget{
  const ListWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget>{
  List<EpisodeModel> lstProduct = [];

  @override
  void initState(){
    super.initState();
    lstProduct = createDataList(4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(14),
          alignment: Alignment.center,
          child: ListView.builder(
              itemCount: lstProduct.length,
              itemBuilder: (context, index) {
                return itemListView(lstProduct[index]);
              })
      ),
    );
  }

  Widget itemListView(EpisodeModel episodeModel)
  {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: AppColors.Background),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/' + episodeModel.img!,
            height: 80,
            width: 80,
            errorBuilder: (context, error, strackTrace) => const Icon(Icons.image),
          ),
          const SizedBox(width: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                episodeModel.name ?? '',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                episodeModel.time.toString(),
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                episodeModel.des!,
                style: const TextStyle(fontSize: 13),
              )
            ],
          )
        ],
      ),
    );
  }
}