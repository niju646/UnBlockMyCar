import 'package:provider/provider.dart';
import 'package:unblockmycar/features/home/data/provider/call_provider.dart';

getProviders() {
  return [ChangeNotifierProvider(create: (_) => CallProvider())];
}
