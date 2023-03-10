// import 'dart:async';
//
// import 'package:geolocator/geolocator.dart';
//
// class LocationService {
//   static const String _kLocationServicesDisabledMessage =
//       'Location services are disabled.';
//   static const String _kPermissionDeniedMessage = 'Permission denied.';
//   static const String _kPermissionDeniedForeverMessage =
//       'Permission denied forever.';
//   static const String _kPermissionGrantedMessage = 'Permission granted.';
//
//   final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
//   final List<_PositionItem> _positionItems = <_PositionItem>[];
//   StreamSubscription<Position>? _positionStreamSubscription;
//   StreamSubscription<ServiceStatus>? _serviceStatusStreamSubscription;
//   bool positionStreamStarted = false;
//   void toggleServiceStatusStream() {
//     if (_serviceStatusStreamSubscription == null) {
//       final serviceStatusStream = _geolocatorPlatform.getServiceStatusStream();
//       _serviceStatusStreamSubscription =
//           serviceStatusStream.handleError((error) {
//         _serviceStatusStreamSubscription?.cancel();
//         _serviceStatusStreamSubscription = null;
//       }).listen((serviceStatus) {
//         String serviceStatusValue;
//         if (serviceStatus == ServiceStatus.enabled) {
//           if (positionStreamStarted) {
//             _toggleListening();
//           }
//           serviceStatusValue = 'enabled';
//         } else {
//           if (_positionStreamSubscription != null) {
//             // setState(() {
//             _positionStreamSubscription?.cancel();
//             _positionStreamSubscription = null;
//             _updatePositionList(
//                 _PositionItemType.log, 'Position Stream has been canceled');
//             // });
//           }
//           serviceStatusValue = 'disabled';
//         }
//         _updatePositionList(
//           _PositionItemType.log,
//           'Location service has been $serviceStatusValue',
//         );
//       });
//     }
//   }
//
//   void _toggleListening() {
//     if (_positionStreamSubscription == null) {
//       final positionStream = _geolocatorPlatform.getPositionStream();
//       _positionStreamSubscription = positionStream.handleError((error) {
//         _positionStreamSubscription?.cancel();
//         _positionStreamSubscription = null;
//       }).listen((position) => _updatePositionList(
//             _PositionItemType.position,
//             position.toString(),
//           ));
//       _positionStreamSubscription?.pause();
//     }
//
//     // setState(() {
//     if (_positionStreamSubscription == null) {
//       return;
//     }
//
//     String statusDisplayValue;
//     if (_positionStreamSubscription!.isPaused) {
//       _positionStreamSubscription!.resume();
//       statusDisplayValue = 'resumed';
//     } else {
//       _positionStreamSubscription!.pause();
//       statusDisplayValue = 'paused';
//     }
//
//     _updatePositionList(
//       _PositionItemType.log,
//       'Listening for position updates $statusDisplayValue',
//     );
//     // });
//   }
//
//   void _updatePositionList(_PositionItemType type, String displayValue) {
//     _positionItems.add(_PositionItem(type, displayValue));
//     // setState(() {});
//   }
// }
//
// enum _PositionItemType {
//   log,
//   position,
// }
//
// class _PositionItem {
//   _PositionItem(this.type, this.displayValue);
//
//   final _PositionItemType type;
//   final String displayValue;
// }
