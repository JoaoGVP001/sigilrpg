import 'package:flutter/foundation.dart';
import 'package:sigilrpg/models/campaign.dart';

class CampaignsController extends ChangeNotifier {
  final List<Campaign> _campaigns = <Campaign>[];

  List<Campaign> get campaigns => List.unmodifiable(_campaigns);

  void add(Campaign c) {
    _campaigns.add(c);
    notifyListeners();
  }
}
