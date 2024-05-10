import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app_final/models/actor.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_final/services/api_services.dart';

class ActorProviders extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;

  List<Actor> actors = [];
  //List<Actor> get actors => _actors;

  void addListActors() {
    for (var i in listActors) {
      insertActor(i);
    }
  }

  Future<void> fetchActors() async {
    try {
      final response = await http.get(Uri.parse('$urlApi/getActors'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        actors = responseData.map((json) => Actor.fromJson(json)).toList();
        notifyListeners();
      } else {
        print('Failed to load actors: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading actors: $e');
    }
  }

  Future<dynamic> findActor(String actorId) async {
    final url = Uri.parse('$urlApi/findActor/$actorId');
    try {
      final response = await http.get(Uri.parse('url'));
      if (response.statusCode == 200) {
        // Nếu request thành công và có dữ liệu trả về
        final dynamic actor = json.decode(response.body);
        return actor;
      } else if (response.statusCode == 404) {
        // Nếu không tìm thấy diễn viên
        print('Actor not found');
        return null;
      } else {
        // Nếu request không thành công, hoặc có lỗi ở server
        print('Failed to find actor: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Nếu có lỗi xảy ra trong quá trình gửi request
      print('Error finding actor: $e');
      return null;
    }
  }

  Future<void> insertActor(Actor actor) async {
    try {
      final response = await http.post(
        Uri.parse('$urlApi/insertActor'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(actor.toJson()),
      );

      if (response.statusCode == 201) {
        // Diễn viên được thêm thành công
        print('Actor inserted successfully');
      } else {
        print('Failed to insert actor: ${response.body}');
      }
    } catch (error) {
      print('Error inserting actor: $error');
    }
  }

  List<Actor> listActors = [
    //Cái giá của hạnh phúc
    Actor(
        name: "Nguyễn Ngọc Lâm",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fcaigiacuahanhphuc%2Fdirector_Nguyen_Ngoc_Lam.png?alt=media&token=c19bd8a8-43a0-4b8b-a994-4b58d2456eb1"),
    Actor(
        name: "Xuân Lan",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fcaigiacuahanhphuc%2FXuan_Lan.png?alt=media&token=378aef1e-0994-4fa1-812c-e3489577642d"),
    Actor(
        name: "Thái Hoà",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fcaigiacuahanhphuc%2FThai_Hoa.png?alt=media&token=7f73d582-bf91-44aa-84b5-4090f939a62e"),
    Actor(
        name: "Lâm Thanh Nhã",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fcaigiacuahanhphuc%2FLam_Thanh_Nha.png?alt=media&token=2d67f6f6-5e02-4477-8455-8e45769cb0ac"),
    Actor(
        name: "Uyển Ân",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fcaigiacuahanhphuc%2FUyen_An.png?alt=media&token=79633679-c411-4aa0-af87-5f8ec8174a4a"),

    //Mùa hè của Luca
    Actor(
        name: "Enrico Casarosa",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmuahecualuca%2Fdirector_Enrico_Casarosa.png?alt=media&token=214b7f57-cfdc-48fc-b29b-78e16f15deb5"),
    Actor(
        name: "acob Tremblay",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmuahecualuca%2Facob_Tremblay.png?alt=media&token=6213b3ea-0c1b-4732-8e9c-d48637cb9625"),
    Actor(
        name: "Jack Dylan Grazer",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmuahecualuca%2FJack_Dylan_Grazer.png?alt=media&token=50cdca15-d09c-4f23-8f4f-eb81024686dc"),
    Actor(
        name: "Emma Berman",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmuahecualuca%2FEmma_Berman.png?alt=media&token=e44618fb-e653-4dae-ae5e-29d7da7136f6"),
    Actor(
        name: "Saverio Raimondo",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmuahecualuca%2FSaverio-Raimondo.png?alt=media&token=c954db5e-c75a-4a2c-b5a7-5cc212b7d9e1"),

    //Anh hùng bàn phím
    Actor(
        name: "Ahn Guk Jin",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fanhhungbanphim%2Fdirector_Ahn_Guk_Jin.png?alt=media&token=472130f6-7420-4f0c-bfa3-43d4fa8a625f"),
    Actor(
        name: "Son Sukku",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fanhhungbanphim%2FSon_Suk_ku.png?alt=media&token=7caab378-f605-422a-be51-d73bac737b88"),
    Actor(
        name: "Kim Sung-Cheol",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fanhhungbanphim%2FKim_Sung-Cheol.png?alt=media&token=6be697e2-33bd-4181-9824-dc571b59897a"),
    Actor(
        name: "Kim Dong-Hwi",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fanhhungbanphim%2FKim_Dong-hwi.png?alt=media&token=466a35bb-ac34-401d-8748-bc4a18e1e69a"),
    Actor(
        name: "Hong Kyung",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fanhhungbanphim%2FHong_Kyung.png?alt=media&token=bb733a81-c9a2-4645-9f62-b4440f8ee4d8"),

    //THANH XUÂN 18x2: LỮ TRÌNH HƯỚNG VỀ EM
    Actor(
        name: "Fujii Michihito",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fthanhxuan18x2%3ALuTrinhhuongveem%2Fdirector_Fujii_Michihito.png?alt=media&token=acd291ee-a04e-4545-af25-4c4b9051fbc8"),
    Actor(
        name: "Greg Hsu",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fthanhxuan18x2%3ALuTrinhhuongveem%2FGreg_Hsu.png?alt=media&token=cceb8168-5e2c-46b7-a310-7064cd327e95"),
    Actor(
        name: "Kaya Kiyohara",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fthanhxuan18x2%3ALuTrinhhuongveem%2FKaya_Kiyohara.png?alt=media&token=b0387f4e-a8d7-4032-b081-48ff5c797139"),
    Actor(
        name: "Chang Chen",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fthanhxuan18x2%3ALuTrinhhuongveem%2FChang_Chen.png?alt=media&token=73d95cfc-ce2a-40e5-8ef8-e315379c7e74"),
    Actor(
        name: "Kuroki Hitomi",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fthanhxuan18x2%3ALuTrinhhuongveem%2FKuroki_Hitomi.png?alt=media&token=aa602a94-b87e-4f3a-a696-1958ae2e4552"),

    //Ngày tàn của đế quốc
    Actor(
        name: "Alex Garland",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fngaytancuadequoc%2Fdirector_Alex_Garland.png?alt=media&token=5f1967e6-55d4-4264-aaac-0abb318587a9"),
    Actor(
        name: "Wagner Moura",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fngaytancuadequoc%2FWagner_Moura.png?alt=media&token=4d1f8a91-1466-4d29-8488-f7233d37f211"),
    Actor(
        name: "Kirsten Dunst",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fngaytancuadequoc%2FKirsten_Dunst.png?alt=media&token=b9a855e4-7f78-42ec-8544-dad30d8af8b5"),
    Actor(
        name: "Cailee Spaeny",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fngaytancuadequoc%2FCailee_Spaeny.png?alt=media&token=f2d89729-e891-4338-bf6a-bed06b303847"),
    Actor(
        name: "Justin James Boykin",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fngaytancuadequoc%2FJustin_James_Boykin.png?alt=media&token=f357fbb1-a3c8-4171-aac4-5538a839b0da"),

    //Trạng quỳnh
    Actor(
        name: "Đỗ Đức Thịnh",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftrangquynh%2Fdirector_duc_thinh.png?alt=media&token=e770f307-40dd-4399-9d0e-b175d588dd4d"),
    Actor(
        name: "Trần Quốc Anh",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftrangquynh%2Ftran_quoc_anh.png?alt=media&token=55095dc5-ddde-41f7-826e-8a446eba2ad3"),
    Actor(
        name: "Nhã Phương",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftrangquynh%2Fnha_phuong.png?alt=media&token=0067e76a-ef51-4a5e-9b97-ff990b1c7635"),
    Actor(
        name: "Trấn Thành",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftrangquynh%2Ftran_thanh.png?alt=media&token=e0e93d97-ca08-485d-86dc-eb925d088ffd"),
    Actor(
        name: "Công Dương",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftrangquynh%2Fcong_duong.png?alt=media&token=c51172e9-9571-41a6-b9c4-96e349e0ab3f"),
  ];
  String linkytb = " https://www.youtube.com/watch?v=WLEhociPWzA";
  // download => xóa ube đi rồi chuyển sang mp4  download về.
  //https://www.yout.com/watch?v=WLEhociPWzA
}
