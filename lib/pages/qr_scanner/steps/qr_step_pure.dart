import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_trackify/pages/qr_scanner/bloc/qr_bloc.dart';

class QrStepPure extends StatelessWidget {
  const QrStepPure({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        print(state.userData);
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Aktualny stan w pracy',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              Text(
                state.userData!.status,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.red),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              ElevatedButton(
                onPressed: () => context.read<QrBloc>().setStepOne(),
                child: Text('Skanuj QR'),
              ),
            ],
          ),
        );
      },
    );
  }
}
