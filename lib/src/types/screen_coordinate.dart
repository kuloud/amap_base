// Copyright 2025 kuloud. All rights reserved.
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart' show immutable, objectRuntimeType;

/// Represents a point coordinate in the [AMap]'s view.
///
/// The screen location is specified in screen pixels (not display pixels) relative
/// to the top left of the map, not top left of the whole screen. (x, y) = (0, 0)
/// corresponds to top-left of the [AMap] not the whole screen.
@immutable
class ScreenCoordinate {
  /// Creates an immutable representation of a point coordinate in the [AMap]'s view.
  const ScreenCoordinate({
    required this.x,
    required this.y,
  });

  /// Represents the number of pixels from the left of the [AMap].
  final int x;

  /// Represents the number of pixels from the top of the [AMap].
  final int y;

  /// Converts this object to something serializable in JSON.
  Object toJson() {
    return <String, int>{
      'x': x,
      'y': y,
    };
  }

  @override
  String toString() => '${objectRuntimeType(this, 'ScreenCoordinate')}($x, $y)';

  @override
  bool operator ==(Object other) {
    return other is ScreenCoordinate && other.x == x && other.y == y;
  }

  @override
  int get hashCode => Object.hash(x, y);
}
