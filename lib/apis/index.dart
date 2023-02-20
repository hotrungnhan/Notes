import 'package:chopper/chopper.dart';
import 'package:notes/apis/switch_game.service.dart';

final apiService = ChopperClient(
  baseUrl: Uri.parse("https://api.sampleapis.com"),
  services: [
    SwitchGameService.create(),
  ],
);
