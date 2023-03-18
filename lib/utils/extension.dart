extension SaveIndex<T> on List<T> {
  T? saveElementAt(int index) => length <= index ? null : elementAt(index);
}
