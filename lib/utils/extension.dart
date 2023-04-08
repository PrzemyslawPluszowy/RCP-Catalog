extension SaveIndex<T> on List<T> {
  T? saveElementAt(int index) => length <= index ? null : elementAt(index);
}

extension AddVat on String {
  String addVat() {
    return (double.parse(this) * 1.23).toStringAsFixed(2);
  }
}
                                // '${double.parse(listToShow[index].price).toStringAsFixed(2).addVat()}€ inc. Vat',
