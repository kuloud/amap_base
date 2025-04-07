// Copyright 2025 kuloud. All rights reserved.
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:x_amap_base/amap_flutter_base.dart';

/// The interface that platform-specific implementations of `amap_map` must extend.
///
/// Avoid `implements` of this interface. Using `implements` makes adding any new
/// methods here a breaking change for end users of your platform!
///
/// Do `extends AMapFlutterPlatform` instead, so new methods added here are
/// inherited in your code with the default implementation (that throws at runtime),
/// rather than breaking your users at compile time.
abstract class AMapFlutterPlatform extends PlatformInterface {
  /// Constructs a AMapFlutterPlatform.
  AMapFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static AMapFlutterPlatform _instance = MethodChannelAMapFlutter();

  /// The default instance of [AMapFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelGoogleMapsFlutter].
  static AMapFlutterPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [AMapFlutterPlatform] when they register themselves.
  static set instance(AMapFlutterPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// /// Initializes the platform interface with [id].
  ///
  /// This method is called when the plugin is first initialized.
  Future<void> init(int mapId) {
    throw UnimplementedError('init() has not been implemented.');
  }

  /// Updates configuration options of the map user interface.
  ///
  /// Change listeners are notified once the update has been made on the
  /// platform side.
  ///
  /// The returned [Future] completes after listeners have been notified.
  Future<void> updateMapConfiguration(
    MapConfiguration configuration, {
    required int mapId,
  }) {
    throw UnimplementedError(
        'updateMapConfiguration() has not been implemented.');
  }

  /// Updates marker configuration.
  ///
  /// Change listeners are notified once the update has been made on the
  /// platform side.
  ///
  /// The returned [Future] completes after listeners have been notified.
  Future<void> updateMarkers(
    MarkerUpdates markerUpdates, {
    required int mapId,
  }) {
    throw UnimplementedError('updateMarkers() has not been implemented.');
  }

  /// Updates polygon configuration.
  ///
  /// Change listeners are notified once the update has been made on the
  /// platform side.
  ///
  /// The returned [Future] completes after listeners have been notified.
  Future<void> updatePolygons(
    PolygonUpdates polygonUpdates, {
    required int mapId,
  }) {
    throw UnimplementedError('updatePolygons() has not been implemented.');
  }

  /// Updates polyline configuration.
  ///
  /// Change listeners are notified once the update has been made on the
  /// platform side.
  ///
  /// The returned [Future] completes after listeners have been notified.
  Future<void> updatePolylines(
    PolylineUpdates polylineUpdates, {
    required int mapId,
  }) {
    throw UnimplementedError('updatePolylines() has not been implemented.');
  }

  /// Updates circle configuration.
  ///
  /// Change listeners are notified once the update has been made on the
  /// platform side.
  ///
  /// The returned [Future] completes after listeners have been notified.
  Future<void> updateCircles(
    CircleUpdates circleUpdates, {
    required int mapId,
  }) {
    throw UnimplementedError('updateCircles() has not been implemented.');
  }

  /// Updates heatmap configuration.
  ///
  /// Change listeners are notified once the update has been made on the
  /// platform side.
  ///
  /// The returned [Future] completes after listeners have been notified.
  Future<void> updateHeatmaps(
    HeatmapUpdates heatmapUpdates, {
    required int mapId,
  }) {
    throw UnimplementedError('updateHeatmaps() has not been implemented.');
  }

  /// Updates tile overlay configuration.
  ///
  /// Change listeners are notified once the update has been made on the
  /// platform side.
  ///
  /// The returned [Future] completes after listeners have been notified.
  Future<void> updateTileOverlays({
    required Set<TileOverlay> newTileOverlays,
    required int mapId,
  }) {
    throw UnimplementedError('updateTileOverlays() has not been implemented.');
  }

  /// Updates cluster manager configuration.
  ///
  /// Change listeners are notified once the update has been made on the
  /// platform side.
  ///
  /// The returned [Future] completes after listeners have been notified.
  Future<void> updateClusterManagers(
    ClusterManagerUpdates clusterManagerUpdates, {
    required int mapId,
  }) {
    throw UnimplementedError(
        'updateClusterManagers() has not been implemented.');
  }

  /// Updates ground overlay configuration.
  ///
  /// The returned [Future] completes once the update has been made on the
  /// platform side.
  Future<void> updateGroundOverlays(
    GroundOverlayUpdates groundOverlayUpdates, {
    required int mapId,
  }) {
    throw UnimplementedError(
        'updateGroundOverlays() has not been implemented.');
  }

  /// Clears the tile cache so that all tiles will be requested again from the
  /// [TileProvider].
  ///
  /// The current tiles from this tile overlay will also be
  /// cleared from the map after calling this method. The Google Maps SDK maintains a small
  /// in-memory cache of tiles. If you want to cache tiles for longer, you
  /// should implement an on-disk cache.
  Future<void> clearTileCache(
    TileOverlayId tileOverlayId, {
    required int mapId,
  }) {
    throw UnimplementedError('clearTileCache() has not been implemented.');
  }

  /// Starts an animated change of the map camera position.
  ///
  /// The returned [Future] completes after the change has been started on the
  /// platform side.
  Future<void> animateCamera(
    CameraUpdate cameraUpdate, {
    required int mapId,
  }) {
    throw UnimplementedError('animateCamera() has not been implemented.');
  }

  /// Starts an animated change of the map camera position using the provided
  /// [CameraUpdateAnimationConfiguration].
  ///
  /// The returned [Future] completes after the change has been started on the
  /// platform side.
  Future<void> animateCameraWithConfiguration(
    CameraUpdate cameraUpdate,
    CameraUpdateAnimationConfiguration configuration, {
    required int mapId,
  }) {
    return animateCamera(cameraUpdate, mapId: mapId);
  }

  /// Changes the map camera position.
  ///
  /// The returned [Future] completes after the change has been made on the
  /// platform side.
  Future<void> moveCamera(
    CameraUpdate cameraUpdate, {
    required int mapId,
  }) {
    throw UnimplementedError('moveCamera() has not been implemented.');
  }

  /// Sets the styling of the base map.
  ///
  /// Set to `null` to clear any previous custom styling.
  ///
  /// If problems were detected with the [mapStyle], including un-parsable
  /// styling JSON, unrecognized feature type, unrecognized element type, or
  /// invalid styler keys: [MapStyleException] is thrown and the current
  /// style is left unchanged.
  ///
  /// The style string can be generated using [map style tool](https://mapstyle.withgoogle.com/).
  Future<void> setMapStyle(
    String? mapStyle, {
    required int mapId,
  }) {
    throw UnimplementedError('setMapStyle() has not been implemented.');
  }

  /// Return the region that is visible in a map.
  Future<LatLngBounds> getVisibleRegion({
    required int mapId,
  }) {
    throw UnimplementedError('getVisibleRegion() has not been implemented.');
  }

  /// Return [ScreenCoordinate] of the [LatLng] in the current map view.
  ///
  /// A projection is used to translate between on screen location and geographic coordinates.
  /// Screen location is in screen pixels (not display pixels) with respect to the top left corner
  /// of the map, not necessarily of the whole screen.
  Future<ScreenCoordinate> getScreenCoordinate(
    LatLng latLng, {
    required int mapId,
  }) {
    throw UnimplementedError('getScreenCoordinate() has not been implemented.');
  }

  /// Returns [LatLng] corresponding to the [ScreenCoordinate] in the current map view.
  ///
  /// A projection is used to translate between on screen location and geographic coordinates.
  /// Screen location is in screen pixels (not display pixels) with respect to the top left corner
  /// of the map, not necessarily of the whole screen.
  Future<LatLng> getLatLng(
    ScreenCoordinate screenCoordinate, {
    required int mapId,
  }) {
    throw UnimplementedError('getLatLng() has not been implemented.');
  }

  /// Programmatically show the Info Window for a [Marker].
  ///
  /// The `markerId` must match one of the markers on the map.
  /// An invalid `markerId` triggers an "Invalid markerId" error.
  ///
  /// * See also:
  ///   * [hideMarkerInfoWindow] to hide the Info Window.
  ///   * [isMarkerInfoWindowShown] to check if the Info Window is showing.
  Future<void> showMarkerInfoWindow(
    MarkerId markerId, {
    required int mapId,
  }) {
    throw UnimplementedError(
        'showMarkerInfoWindow() has not been implemented.');
  }

  /// Programmatically hide the Info Window for a [Marker].
  ///
  /// The `markerId` must match one of the markers on the map.
  /// An invalid `markerId` triggers an "Invalid markerId" error.
  ///
  /// * See also:
  ///   * [showMarkerInfoWindow] to show the Info Window.
  ///   * [isMarkerInfoWindowShown] to check if the Info Window is showing.
  Future<void> hideMarkerInfoWindow(
    MarkerId markerId, {
    required int mapId,
  }) {
    throw UnimplementedError(
        'hideMarkerInfoWindow() has not been implemented.');
  }

  /// Returns `true` when the [InfoWindow] is showing, `false` otherwise.
  ///
  /// The `markerId` must match one of the markers on the map.
  /// An invalid `markerId` triggers an "Invalid markerId" error.
  ///
  /// * See also:
  ///   * [showMarkerInfoWindow] to show the Info Window.
  ///   * [hideMarkerInfoWindow] to hide the Info Window.
  Future<bool> isMarkerInfoWindowShown(
    MarkerId markerId, {
    required int mapId,
  }) {
    throw UnimplementedError('updateMapOptions() has not been implemented.');
  }

  /// Returns the current zoom level of the map.
  Future<double> getZoomLevel({
    required int mapId,
  }) {
    throw UnimplementedError('getZoomLevel() has not been implemented.');
  }

  /// Returns the image bytes of the map.
  ///
  /// Returns null if a snapshot cannot be created.
  Future<Uint8List?> takeSnapshot({
    required int mapId,
  }) {
    throw UnimplementedError('takeSnapshot() has not been implemented.');
  }

  // The following are the 11 possible streams of data from the native side
  // into the plugin

  /// The Camera started moving.
  Stream<CameraMoveStartedEvent> onCameraMoveStarted({required int mapId}) {
    throw UnimplementedError('onCameraMoveStarted() has not been implemented.');
  }

  /// The Camera finished moving to a new [CameraPosition].
  Stream<CameraMoveEvent> onCameraMove({required int mapId}) {
    throw UnimplementedError('onCameraMove() has not been implemented.');
  }

  /// The Camera is now idle.
  Stream<CameraIdleEvent> onCameraIdle({required int mapId}) {
    throw UnimplementedError('onCameraMove() has not been implemented.');
  }

  /// A [Marker] has been tapped.
  Stream<MarkerTapEvent> onMarkerTap({required int mapId}) {
    throw UnimplementedError('onMarkerTap() has not been implemented.');
  }

  /// An [InfoWindow] has been tapped.
  Stream<InfoWindowTapEvent> onInfoWindowTap({required int mapId}) {
    throw UnimplementedError('onInfoWindowTap() has not been implemented.');
  }

  /// A [Marker] has been dragged to a different [LatLng] position.
  Stream<MarkerDragStartEvent> onMarkerDragStart({required int mapId}) {
    throw UnimplementedError('onMarkerDragEnd() has not been implemented.');
  }

  /// A [Marker] has been dragged to a different [LatLng] position.
  Stream<MarkerDragEvent> onMarkerDrag({required int mapId}) {
    throw UnimplementedError('onMarkerDragEnd() has not been implemented.');
  }

  /// A [Marker] has been dragged to a different [LatLng] position.
  Stream<MarkerDragEndEvent> onMarkerDragEnd({required int mapId}) {
    throw UnimplementedError('onMarkerDragEnd() has not been implemented.');
  }

  /// A [Polyline] has been tapped.
  Stream<PolylineTapEvent> onPolylineTap({required int mapId}) {
    throw UnimplementedError('onPolylineTap() has not been implemented.');
  }

  /// A [Polygon] has been tapped.
  Stream<PolygonTapEvent> onPolygonTap({required int mapId}) {
    throw UnimplementedError('onPolygonTap() has not been implemented.');
  }

  /// A [Circle] has been tapped.
  Stream<CircleTapEvent> onCircleTap({required int mapId}) {
    throw UnimplementedError('onCircleTap() has not been implemented.');
  }

  /// A Map has been tapped at a certain [LatLng].
  Stream<MapTapEvent> onTap({required int mapId}) {
    throw UnimplementedError('onTap() has not been implemented.');
  }

  /// A Map has been long-pressed at a certain [LatLng].
  Stream<MapLongPressEvent> onLongPress({required int mapId}) {
    throw UnimplementedError('onLongPress() has not been implemented.');
  }

  /// A marker icon managed by [ClusterManager] has been tapped.
  Stream<ClusterTapEvent> onClusterTap({required int mapId}) {
    throw UnimplementedError('onClusterTap() has not been implemented.');
  }

  /// A [GroundOverlay] has been tapped.
  Stream<GroundOverlayTapEvent> onGroundOverlayTap({required int mapId}) {
    throw UnimplementedError('onGroundOverlayTap() has not been implemented.');
  }

  /// Dispose of whatever resources the `mapId` is holding on to.
  void dispose({required int mapId}) {
    throw UnimplementedError('dispose() has not been implemented.');
  }

  /// If the last attempt to set the style via [MapConfiguration.style] failed,
  /// returns the error information, otherwise returns null.
  Future<String?> getStyleError({required int mapId}) async {
    return null;
  }

  /// Returns a widget displaying the map view.
  Widget buildViewWithConfiguration(
    int creationId,
    PlatformViewCreatedCallback onPlatformViewCreated, {
    required MapWidgetConfiguration widgetConfiguration,
    MapConfiguration mapConfiguration = const MapConfiguration(),
    MapObjects mapObjects = const MapObjects(),
  }) {
    throw UnimplementedError(
        'buildViewWithConfiguration() has not been implemented.');
  }
}
