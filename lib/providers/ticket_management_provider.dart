import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/ticket_item_model.dart';

class TicketManagement extends ChangeNotifier {
  //Danh sách ticket
  List<Ticket> listTicket = [
    Ticket(
      MovieName: 'Mai',
      DateTime: '14h15 . 16.12.2022',
      TheaterLocation: 'Vincom Ocean Park CGV',
      Image: 'assets/img_3.jpg', // Đường dẫn tới hình ảnh
    ),
    Ticket(
      MovieName: 'Gặp lại chị bầu',
      DateTime: '2h15 . 22.12.2022',
      TheaterLocation: 'Vincom Ocean Park CGV',
      Image: 'assets/img_2.jpg', // Đường dẫn tới hình ảnh
    ),
    Ticket(
      MovieName: 'Phở, đào và piano',
      DateTime: '14h15 . 29.12.2022',
      TheaterLocation: 'Vincom Ocean Park CGV',
      Image: 'assets/img_1.jpg', // Đường dẫn tới hình ảnh
    ),
  ];
}
