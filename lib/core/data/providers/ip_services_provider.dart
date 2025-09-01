import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/ip_services.dart';

final ipServicesProvider = Provider<IPServices>((ref) => IPServices());
