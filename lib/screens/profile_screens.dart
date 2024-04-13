import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/profile_model.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/models/order_model.dart';
import 'package:movie_app_final/models/user.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/profile_item.dart';
import 'package:provider/provider.dart';

import '../resources/dimens.dart';

class HomeProfileScreens extends StatefulWidget {
  const HomeProfileScreens({Key? key}) : super(key: key);

  static const routeName = '/home-profile-movie';

  @override
  State<HomeProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<HomeProfileScreens> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).fetchUsers();
    Provider.of<Movieproviders>(context, listen: false).fetchAllMovies();
    // Provider.of<OrdersProvider>(context, listen: false).insertOrder(OrderModel(
    //     userId: "1234",
    //     movieId: "123",
    //     dateMovie: "04/08/2024",
    //     timeMovie: "2h14'",
    //     section: 4,
    //     seats: "H7, H8",
    //     prices: 127000,
    //     nameCinema: "Cinema TPHCM",
    //     locationCinema: "HCM"));
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AuthProvider>(context);
    final dataMovie = Provider.of<Movieproviders>(context);
    var currentUser = data.CurrentUser;
    var listUser = data.users;
    return Column(
      children: [
        ProfileItemWidget(
          currentUser: currentUser,
        ),
        Expanded(
            child: Column(
          children: [
            Text(
              "All Movies: ${dataMovie.listAllMovie.length.toString()}",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              listUser.length.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            TextButton(
                onPressed: () async {
                  User newUser = User(
                      name: "Lê Tiến Thành",
                      phone: "0904962412",
                      mail: "ltthanh@gmail.com",
                      urlImage: 'URLIMAGE');
                  await data.insertUser(newUser);
                },
                child: Text("Insert data")),
            // TextButton(
            //     onPressed: () {
            //       data.deleteUser('6612575155d35b36df1e4cf1');
            //     },
            //     child: Text("Delete")),
            // TextButton(
            //     onPressed: () {
            //       data.updateUser(
            //           '6612575155d35b36df1e4cf1', "LTT", "URLIMAGE2");
            //     },
            //     child: Text("Upadate")),
            TextButton(
                onPressed: () async {
                  MovieModel movie =
                      await dataMovie.getMovieById("661a43a063097f49afd030d1");
                  print(movie.name);
                },
                child: Text("Find movie")),
          ],
        ))
      ],
    );
  }
}
//r