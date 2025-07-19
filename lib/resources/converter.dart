import 'package:intl/intl.dart';

class ConverterGloabal {
  static String formatPrice(double price) {
    return '${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.')} VNĐ';
  }

  //sub
  static List<String> removeSpacesAndSplit(String text) {
    String trimmedText = text.replaceAll(' ', '');
    List<String> parts = trimmedText.split(",");
    return parts;
  }

  static String ConvertDateTimeToString(DateTime date) {
    String formattedDate = DateFormat('yyyy/MM/dd').format(date);
    return formattedDate;
  }
}
