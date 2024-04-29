import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_final/models/movie.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/providers/ticket_management_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/ticket_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/ticket_item.dart';
import 'package:provider/provider.dart';
import '../models/model_widget/ticket_item_model.dart';

class TicketMovieScreens extends StatefulWidget {
  const TicketMovieScreens({Key? key}) : super(key: key);
  static const routeName = '/home-ticket-movie';

  @override
  State<TicketMovieScreens> createState() => _TicketMovieScreensState();
}

class _TicketMovieScreensState extends State<TicketMovieScreens> {
  @override
  void initState() {
    Provider.of<OrdersProvider>(context, listen: false).fetchListOrderOfUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final data = Provider.of<TicketManagement>(context);
    final dataOrder = Provider.of<OrdersProvider>(context);
    final dataAuth = Provider.of<AuthProvider>(context);
    final dataMovie = Provider.of<Movieproviders>(context);

    List<Ticket> ListTicket = [];

    for (var e in dataOrder.currentListOrderUser) {
      var movie = dataMovie.findMovieById(e.movieId);
      if (movie != null) {
        Ticket ticket = Ticket(
            id: e.id,
            MovieName: movie.name,
            DateTime: "${e.timeMovie}*${e.dateMovie}",
            TheaterLocation: e.locationCinema,
            Image: movie.thumbnail);

        ListTicket.add(ticket);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 5),
        const CustomAppBar(
          title: 'My ticket',
          showBackButton: false,
        ),
        Expanded(
          child: dataOrder.currentUserId == '' || ListTicket.isEmpty
              ? Center(
                  child: SvgPicture.asset(
                    "./assets/icons/no-ticket.svg",
                    width: 100,
                    height: 130,
                    // ignore: deprecated_member_use
                    color: AppColors.BaseColorMain,
                  ),
                )
              : ListView.builder(
                  itemCount: ListTicket.length,
                  itemBuilder: (context, index) =>
                      TicketItem(ticket: ListTicket[index])),
        ),
      ],
    );
  }
}
