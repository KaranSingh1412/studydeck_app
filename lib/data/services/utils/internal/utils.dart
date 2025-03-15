class CachedValue<T> {
  static const defaultLifetime = 300000; // 5 minutes

  final int lifetime;
  int? lastUpdate;
  T? cached;

  CachedValue({this.lifetime = defaultLifetime});

  Future<T> get(Future<T> Function() getter) async {
    if (lastUpdate == null ||
        lastUpdate! - DateTime.now().millisecondsSinceEpoch > lifetime) {
      cached = await getter();
      lastUpdate = DateTime.now().millisecondsSinceEpoch;
    }
    return cached as T;
  }

  void clear() {
    lastUpdate = null;
  }
}

class CachedMap<K, V> {
  final Map<K, CachedValue<V>> _values = {};

  Future<V> get(K key, Future<V> Function(K key) getter) async {
    if (!_values.containsKey(key)) _values[key] = CachedValue();
    return _values[key]!.get(() => getter(key));
  }

  void clear() {
    _values.clear();
  }
}
