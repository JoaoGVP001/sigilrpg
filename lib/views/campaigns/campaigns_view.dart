import 'package:flutter/material.dart';

class CampaignsView extends StatelessWidget {
  const CampaignsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campanhas')),
      body: const Center(child: Text('Lista/CRUD de campanhas (placeholder)')),
    );
  }
}
