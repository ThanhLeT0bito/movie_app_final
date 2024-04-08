import '../models/episode.dart';

createDataList(int amount){
  List<EpisodeModel> lstEpisode = [];
  for(int i = 1; i < amount; i++){
    lstEpisode.add(EpisodeModel(
        id: 1,
        name: "Episode $i",
        time: i*10,
        img: "image_$i.jpg",
        des: "Nice movie $i"));
  }
  return lstEpisode;
}