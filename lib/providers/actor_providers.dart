import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app_final/models/actor.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_final/services/api_services.dart';

class ActorProviders extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;

  void addListActors() {
    for (var i in listActors) {
      insertActor(i);
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
    //   //phim mai
    //   Actor(name: "Trấn Thành",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmai%2Fdirector_tranthanh.png?alt=media&token=a6bee975-b827-4bd7-b026-fd74b6eda69e"),
    //   Actor(name: "Phương Anh Đào",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmai%2Fphuonganhdao.png?alt=media&token=73f6911e-b955-44b9-b1c9-61be8078b284"),
    //   Actor(name: "Tuấn Trần",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmai%2Ftuantran.png?alt=media&token=2f4a5089-bef1-4a23-8196-f1c00d7335d6"),
    //   Actor(name: "Uyển Ân",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmai%2Fuyenan.png?alt=media&token=945aaf75-2522-4d97-ba9d-3aa928f4b91f"),
    //   Actor(name: "Hồng Đào",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmai%2Fhongdao.png?alt=media&token=57e7be57-53ec-4252-a09b-6c0918487dd9"),

    //   //gặp lại chị bầu
    //   Actor(name: "Nhất Trung",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fgaplaichibau%2Fdirector-nhattrung.png?alt=media&token=b5eb65a4-a5d6-4337-bb08-6da4dcd31c3a"),
    //   Actor(name: "Ngọc Phước",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fgaplaichibau%2Fngocphuoc.png?alt=media&token=ae137233-d979-4f47-b9df-15f52bcba2f0"),
    //   Actor(name: "Lê Giang",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fgaplaichibau%2Flegiang.png?alt=media&token=27321140-82ca-4e38-9964-027b6b5b8d01"),
    //   Actor(name: "Diệu Nhi",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fgaplaichibau%2Fdieunhi.png?alt=media&token=e6bcbf40-be56-4a6b-86a0-a66fb3cad750"),
    //   Actor(name: "Anh Tú",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fgaplaichibau%2Fanhtu.png?alt=media&token=6f774ede-047d-462c-b8a5-f1a06ea42c54"),

    //   //phở, đào và piano
    //   Actor(name: "Phi Tiến Sơn",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdaophopiano%2Fdirector-phitienson.jpg?alt=media&token=9dd9a4ba-4b6a-435a-8785-ac0a79a96f0c"),
    //   Actor(name: "Tuấn Hưng",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdaophopiano%2Ftuanhung.jpg?alt=media&token=efd1e90c-3680-4f7f-8e48-49eeb991efbb"),
    //   Actor(name: "Trần Lực",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdaophopiano%2Ftranluc.jpg?alt=media&token=85133151-331f-42c3-9aa3-7fcb77e3cb4c"),
    //   Actor(name: "Đoàn Quốc Đam",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdaophopiano%2Fdoanquocdam.jpg?alt=media&token=7b2993f0-36b5-4ef3-ac94-733900e150dd"),
    //   Actor(name: "Cao Thị Thuỳ Linh",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdaophopiano%2Fcaothithuylinh.jpg?alt=media&token=60fb3394-f19c-4609-a1f4-906436dec053"),

    //   //quật mộ trùng ma
    //   Actor(name: "Jang Jae-hyun",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquatmotrungma%2Fdirector-jangjaehuyn.jpg?alt=media&token=e2d604e1-31f6-4db7-97a8-c19e6a1d3161"),
    //   Actor(name: "Kim Go-eun",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquatmotrungma%2Fkimgoeun.jpg?alt=media&token=3b771880-b744-4243-8fdf-bd6ae6c5011e"),
    //   Actor(name: "Lee Do-hyun",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquatmotrungma%2Fleedohuyn.jpg?alt=media&token=c8c06cb6-88c0-4486-8a74-14c1a5d2a202"),
    //   Actor(name: "Yu Hae-jin",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquatmotrungma%2Fyoohajin.jpg?alt=media&token=2d087745-c29b-47fb-8c7b-d9866fa35758"),
    //   Actor(name: "Choi Min-sik",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquatmotrungma%2Fchoiminsik.jpg?alt=media&token=8586dde1-b285-4784-8250-e0faf277311d"),

    //   //mắt biếc
    //   Actor(name: "Victor Vũ",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmatbiec%2Fdirector_Victor_Vu.png?alt=media&token=28844a7b-af0f-4073-854e-2d00bf16c0aa"),
    //   Actor(name: "Trúc Anh",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmatbiec%2Ftrucanh.png?alt=media&token=9821a432-7a59-49ee-846a-6e2f7d1649b0"),
    //   Actor(name: "Trần Nghĩa",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmatbiec%2Ftrannghia.png?alt=media&token=f295a89b-c538-471c-af0a-e881e76ac320"),
    //   Actor(name: "Khánh Vân",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmatbiec%2Fkhanhvan.png?alt=media&token=06903042-2bde-4471-a293-0db5b784b6d6"),
    //   Actor(name: "Trần Phong",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fmatbiec%2Ftranphong.png?alt=media&token=99f52296-b4e4-4e1a-9376-55f015f3cddf"),

    //   //doraemon
    //   Actor(name: "Kazuaki Imai",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdoraemonmovie43%2Fdirector_Imai_Kazuaki.png?alt=media&token=382fce9e-ed63-4bd1-a239-0576e546c23c"),
    //   Actor(name: "Wasabi Mizuta",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdoraemonmovie43%2FWasabi_Mizuta.png?alt=media&token=c9797a2f-ed0e-47a0-9361-6995b21eb04a"),
    //   Actor(name: "Megumi Ôhara",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Ftrannghia.png?alt=media&token=90bf2acb-7cb9-404b-bd48-532bf1f55ed7"),
    //   Actor(name: "Yumi Kakazu",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdoraemonmovie43%2FYumi_Kakazu.png?alt=media&token=a1287ed2-2775-4fa5-a7bc-3838d5511a0d"),
    //   Actor(name: "Subaru Kimura",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fdoraemonmovie43%2FSubaru_Kimura.png?alt=media&token=edbfe3f8-9d1b-455d-b899-95683daea784"),

    //   //Godzilla x Kong
    //   Actor(name: "Adam Wingard",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2FGodzillaxKong%3Adechemoi%2Fdirector_Adam_Wingard.png?alt=media&token=fe0a10be-684d-4249-98f5-bf54fe347646"),
    //   Actor(name: "Rebecca Hall",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2FGodzillaxKong%3Adechemoi%2FRebecca_Hall.png?alt=media&token=220ddd1a-9e6e-4d46-b949-bd9c8d1a675e"),
    //   Actor(name: "Rachel House",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2FGodzillaxKong%3Adechemoi%2FRachel_House.png?alt=media&token=7eda64a8-1618-43f8-b3fb-5e81114edd9e"),
    //   Actor(name: "Dan Stevens",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2FGodzillaxKong%3Adechemoi%2FDan_Stevens.png?alt=media&token=ac8b63ff-f30d-40d8-ac1e-3d42cb9375da"),
    //   Actor(name: "Kaylee Hottle",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2FGodzillaxKong%3Adechemoi%2FKaylee_Hottle.png?alt=media&token=1e51f077-a3ce-4793-8abb-6e8f9112bf2b"),

    //   //kunfupanda
    //   Actor(name: "Mike Mitchell",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fkungfupanda4%2Fdirector_Mike_Mitchell.png?alt=media&token=ae6eaf42-046d-443e-a693-443d05985dbe"),
    //   Actor(name: "Bryan Cranston",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fkungfupanda4%2FBryan_Cranston.png?alt=media&token=a2f5bca7-6eab-41b3-8f27-36ce05fd8981"),
    //   Actor(name: "Lan McShane",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fkungfupanda4%2FIan_McShane.png?alt=media&token=c86dfa60-2ce0-433b-9bfb-d7f5dbdcaac4"),
    //   Actor(name: "Jack Black",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fkungfupanda4%2FJack_Black.png?alt=media&token=a3425c77-fbdf-41a6-8470-113b0d5aa158"),
    //   Actor(name: "Awkwafina",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fkungfupanda4%2FAwkwafina.png?alt=media&token=da0cb7a0-c509-4ef1-ad05-cd7f1aa1ab0e"),

    //   //Bố già
    //   Actor(name: "Trấn Thành",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fbogia%2Fdirector_tranthanh.png?alt=media&token=3dba0b25-1771-4ba0-8e86-9d7a6c686290"),
    //   Actor(name: "Tuấn Trần",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fbogia%2Ftuantran.png?alt=media&token=5b2786e2-1a6c-4589-8ec5-18739202a3ab"),
    //   Actor(name: "Minh Tú",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fbogia%2Fminh_tu.png?alt=media&token=30c61bd4-26c8-4efd-9efc-799467827a12"),
    //   Actor(name: "Lê Giang",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fbogia%2Flegiang.png?alt=media&token=444bf0d2-560e-4154-9966-9576a5d832d8"),
    //   Actor(name: "Chế Nguyễn Quỳnh Châu",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fbogia%2Fche_nguyen_quynh_chau.jpg?alt=media&token=0b1cfd40-31f4-4086-8b41-ee8f8f739490"),

    //   //Quỷ Cẩu
    //   Actor(name: "Lưu Thành Luân",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquycau%2Fdirector_luu_thanh_luan.png?alt=media&token=ba2de3a0-88d3-4f40-9052-f2090545144c"),
    //   Actor(name: "Đào Anh Tuấn",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquycau%2FDaoAnhTuan.png?alt=media&token=ee4d8730-e386-47a1-8a0f-4a27a9df5bb0"),
    //   Actor(name: "Nam Thư",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquycau%2Fnam_thu.png?alt=media&token=95c9c98a-f90f-4f6a-a674-f0b3c6a27825"),
    //   Actor(name: "Kim Xuân",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquycau%2Fkim_xuan.png?alt=media&token=efad9efb-1c8f-4b7f-8695-b75ccdeda19e"),
    // Actor(name: "Quang Tuấn",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fquycau%2Fquang_tuan.png?alt=media&token=b2c4608c-3ca8-4e09-8488-ee3eee4b1871"),

    //   //Nhà bà nữ
    //   Actor(name: "Trấn Thành",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fnhabanu%2Fdirector_tranthanh.png?alt=media&token=a1d27bc5-cdb5-4a17-a7cf-4ab765ede4fe"),
    //   Actor(name: "Khả Như",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fnhabanu%2Fkha_nhu.png?alt=media&token=d1960c74-16de-4a42-960f-67cee3f62109"),
    //   Actor(name: "Lê Giang",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fnhabanu%2Flegiang.png?alt=media&token=6dcf6b50-7250-477d-9314-2773a17c7775"),
    //   Actor(name: "Song Luân",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fnhabanu%2Fsong_luan.png?alt=media&token=4a876c89-1de2-4fe1-bfd4-ec39e6da9f0b"),
    //   Actor(name: "Uyển Ân",
    //       images:
    //       "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Factor%2Fnhabanu%2Fuyenan.png?alt=media&token=8121e44a-2c66-4f26-abbd-bf9315456a75"),
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
