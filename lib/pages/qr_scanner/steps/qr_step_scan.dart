import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:time_trackify/pages/qr_scanner/bloc/qr_bloc.dart';

class QrStepScan extends StatelessWidget {
  const QrStepScan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrBloc, QrState>(
      listener: (context, state) {
        if (!state.isCameraAllowed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              // final Uint8List? image = capture.image;
              context.read<QrBloc>().setBarcode(barcodes.first.rawValue);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () => context.read<QrBloc>().setStepQrPure(),
              child: const Text('Close'),
            ),
          )
        ],
      ),
    );
  }
}
