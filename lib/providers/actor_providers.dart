import 'package:flutter/material.dart';
import 'package:movie_app_final/models/actor.dart';

class ActorProviders extends ChangeNotifier {
  List<Actor> listActors = [
    Actor(
        name: "James Ali",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2F279314470_386984456637448_3437393956660238075_n.jpg?alt=media&token=395db439-a2c1-40b7-af0f-a7ad5904493a"),
    Actor(name: "alisdiufds", images: "images"),
    Actor(
        name: "Khoa Dan",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2FScreenshot%202023-04-12%20152726.png?alt=media&token=a0b93cec-a33e-49f4-8eea-411a378e3549"),
    Actor(
        name: "Khoa Dan",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2FScreenshot%202023-04-12%20152726.png?alt=media&token=a0b93cec-a33e-49f4-8eea-411a378e3549"),


    Actor(name: "Trấn Thành",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftranthanh.png?alt=media&token=23eec0eb-7555-4183-8ba7-47ed637f6b33"),
    Actor(name: "Phương Anh Đào",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fphuonganhdao.png?alt=media&token=6d94e912-801e-4c69-baab-1c358dc8b72c"),
    Actor(name: "Tuấn Trần",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftuantran.png?alt=media&token=be671165-c003-43f2-b7fb-7a5c03ddbe9f"),
    Actor(name: "Ngọc Phước",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fngocphuoc.png?alt=media&token=54f02325-10de-44b6-abaf-7a93919be368"),
    Actor(name: "Lê Giang",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Flegiang.png?alt=media&token=1de5a729-000f-454c-9ce5-1089f371f91d"),
    Actor(name: "Diệu Nhi",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdieunhi.png?alt=media&token=50eac27c-eb25-4914-ad6a-204c3fc12e98"),
    Actor(name: "Anh Tú",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fanhtu.png?alt=media&token=350a5e6c-80bb-41fa-b9e5-57ea2f20545a"),
    Actor(name: "Đoàn Quốc Đam",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdoanquocdam.png?alt=media&token=77e8aea4-2c2a-4e0c-a499-9427fc751111"),
    Actor(name: "Cao Thị Thuỳ Linh",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fcaothithuylinh.png?alt=media&token=1c0cd578-e021-49cc-970f-a8ce55de4c69"),
    Actor(name: "Choi Min-sik",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fchoiminsik.png?alt=media&token=4fe841ff-307c-48be-9f99-9ee3be3532ae"),
    Actor(name: "Kim Go-eun",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fkimgoeun.png?alt=media&token=0b916b89-5717-4e0e-a485-ffa636cb73a8"),
    Actor(name: "Lee Do-hyun",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fleedohyun.png?alt=media&token=d745d85b-c94f-4b83-ba39-d19b19853ffd"),
    Actor(name: "Yu Hae-jin",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fyuhaejin.png?alt=media&token=a618dab7-0d2d-42a3-a5d9-9dc395343963"),
    Actor(name: "Trần Phong",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftranphong.png?alt=media&token=a2e5c87a-fc66-45fc-86b1-fa10e19af373"),
    Actor(name: "Trúc Anh",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftrucanh.png?alt=media&token=622fa696-c9f7-4f81-a12a-9127164e35fd"),
    Actor(name: "Trần Nghĩa",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftrannghia.png?alt=media&token=90bf2acb-7cb9-404b-bd48-532bf1f55ed7"),
    Actor(name: "Khánh Vân",
        images:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fkhanhvan.png?alt=media&token=020fb7fa-248f-444f-8376-e5fbbff2aa2f"),


  ];
  String linkytb = " https://www.youtube.com/watch?v=WLEhociPWzA";
  // download => xóa ube đi rồi chuyển sang mp4  download về.
  //https://www.yout.com/watch?v=WLEhociPWzA
}
