import '../../generated/l10n.dart';

class ItemRadio {
  final String? id;
  final String? text;
  final String? img;
  bool isSelected;

  ItemRadio({
    this.id,
    this.text,
    this.img,
    this.isSelected = false,
  });
}

List<ItemRadio> listItemCustom = [
  ItemRadio(id: "EN", isSelected: true, text: S.current.English),
  ItemRadio(id: "VN", isSelected: false, text: S.current.VietNamese),
];