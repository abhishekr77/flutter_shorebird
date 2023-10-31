// import 'package:flutter/material.dart';
//
// Future<void> _checkForUpdate() async {
//   setState(() {
//     _isCheckingForUpdate = true;
//   });
//
//   // Ask the Shorebird servers if there is a new patch available.
//   final isUpdateAvailable =
//   await _shorebirdCodePush.isNewPatchAvailableForDownload();
//
//   if (!mounted) return;
//
//   setState(() {
//     _isCheckingForUpdate = false;
//   });
//
//   if (isUpdateAvailable) {
//     _showUpdateAvailableBanner();
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('No update available'),
//       ),
//     );
//   }
// }
//
// void _showDownloadingBanner() {
//   ScaffoldMessenger.of(context).showMaterialBanner(
//     const MaterialBanner(
//       content: Text('Downloading...'),
//       actions: [
//         SizedBox(
//           height: 14,
//           width: 14,
//           child: CircularProgressIndicator(
//             strokeWidth: 2,
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// void _showUpdateAvailableBanner() {
//   ScaffoldMessenger.of(context).showMaterialBanner(
//     MaterialBanner(
//       content: const Text('Update available'),
//       actions: [
//         TextButton(
//           onPressed: () async {
//             ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//             await _downloadUpdate();
//
//             if (!mounted) return;
//             ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//           },
//           child: const Text('Download'),
//         ),
//       ],
//     ),
//   );
// }
//
// void _showRestartBanner() {
//   ScaffoldMessenger.of(context).showMaterialBanner(
//     const MaterialBanner(
//       content: Text('A new patch is ready!'),
//       actions: [
//         TextButton(
//           // Restart the app for the new patch to take effect.
//           onPressed: Restart.restartApp,
//           child: Text('Restart app'),
//         ),
//       ],
//     ),
//   );
// }
//
// Future<void> _downloadUpdate() async {
//   _showDownloadingBanner();
//
//   await Future.wait([
//     _shorebirdCodePush.downloadUpdateIfAvailable(),
//     // Add an artificial delay so the banner has enough time to animate in.
//     Future<void>.delayed(const Duration(milliseconds: 250)),
//   ]);
//
//   if (!mounted) return;
//
//   ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//   _showRestartBanner();
// }