import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_trackify/pages/qr_scanner/bloc/qr_bloc.dart';
import 'package:time_trackify/utils/converts.dart';

class QrStepPure extends StatelessWidget {
  const QrStepPure({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Aktualny stan',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  convertUserStatusToCustomText(
                      context, state.userData?.status),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: convertUserStatusToCustomIcon(
                      context, state.userData?.status),
                ),
              ),
              ElevatedButton(
                onPressed: () => context.read<QrBloc>().setStepQrScan(),
                child: const Text('Skanuj QR'),
              ),
            ],
          ),
        );
      },
    );
  }
}
