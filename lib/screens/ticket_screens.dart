import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    final data = Provider.of<TicketManagement>(context);
    List<Ticket> ListTicket = data.listTicket;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 5),
        const CustomAppBar(
          title: 'My ticket',
          showBackButton: false,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: ListTicket.length,
              itemBuilder: (context, index) =>
                  TicketItem(ticket: ListTicket[index])),
        ),
      ],
    );
  }
}
