extension OldEvenSortAlgorithm on List<int> {
  void oldEvenSort() {
    for (int i = 0; i < length - 1; i++) {
      for (int j = i + 1; j < length; j++) {
        if (this[i] > this[j]) {
          int temp = this[i];
          this[i] = this[j];
          this[j] = temp;
        }
      }
    }
  }
}

void main() {
  [4, 3, 5, 1, 0, 2, 7]
    ..oldEvenSort()
    ..forEach(print);
}
