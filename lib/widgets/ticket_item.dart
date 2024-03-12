import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/ticket_item_model.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: Dimens.MarginTicketItem,
          horizontal: Dimens.MarginTicketItem),
      decoration: BoxDecoration(
        color: AppColors.Background,
        borderRadius: BorderRadius.circular(Dimens.circular),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Dimens.WidthItemTicket,
            height: 150,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Dimens.circular),
                bottomLeft: Radius.circular(Dimens.circular),
              ),
              child: Image.asset(
                ticket.Image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.paddingAll),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ticket.MovieName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.BaseColorTextMain,
                    ),
                  ),
                  const SizedBox(height: Dimens.Sizedbox),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: AppColors.BaseColorWhite,
                      ),
                      const SizedBox(width: Dimens.Sizedbox),
                      Text(
                        ticket.DateTime,
                        style: const TextStyle(
                            fontSize: Dimens.fontsize,
                             color: AppColors.BaseColorWhite),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.Sizedbox),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_city,
                        color: AppColors.BaseColorWhite,
                      ),
                      const SizedBox(width: Dimens.Sizedbox),
                      Text(
                        ticket.TheaterLocation,
                        style: const TextStyle(
                            fontSize: Dimens.fontsize, color: AppColors.BaseColorWhite),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
