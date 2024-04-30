import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_index.g.dart';

@riverpod
class IndexSelectorMonth extends _$IndexSelectorMonth {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int newIndex) {
    state = newIndex;
  }
}

@Riverpod(keepAlive: true)
class IndexHomePage extends _$IndexHomePage {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int newIndex) {
    state = newIndex;
  }
}
