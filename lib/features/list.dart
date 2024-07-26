import 'package:device_frame/device_frame.dart';

List platform = [
  'ios',
  'macOS',
  'android',
  'windows',
  'linux',
];
Map<String, dynamic> devices = {
  'ios': [
    {'iPhone12Mini': Devices.ios.iPhone12Mini},
    {'iPhone12': Devices.ios.iPhone12},
    {'iPhone12ProMax': Devices.ios.iPhone12ProMax},
    {'iPhone13Mini': Devices.ios.iPhone13Mini},
    {'iPhone13': Devices.ios.iPhone13},
    {'iPhone13ProMax': Devices.ios.iPhone13ProMax},
    {'iPhoneSE': Devices.ios.iPhoneSE},
    {'iPadAir4': Devices.ios.iPadAir4},
    {'iPad': Devices.ios.iPad},
    {'iPadPro11Inches_': Devices.ios.iPadPro11Inches},
    {'iPad12InchesGen2': Devices.ios.iPad12InchesGen2},
    {'iPad12InchesGen4': Devices.ios.iPad12InchesGen4},
  ],
  'android': [
    {'bigPhone': Devices.android.bigPhone},
    {'smallPhone': Devices.android.smallPhone},
    {'mediumPhone': Devices.android.mediumPhone},
    {'smallTablet': Devices.android.smallTablet},
    {'mediumTablet': Devices.android.mediumTablet},
    {'largeTablet': Devices.android.largeTablet},
    {'samsungGalaxyA50': Devices.android.samsungGalaxyA50},
    {'samsungGalaxyS20': Devices.android.samsungGalaxyS20},
    {'samsungGalaxyNote20': Devices.android.samsungGalaxyNote20},
    {'samsungGalaxyNote20Ultra': Devices.android.samsungGalaxyNote20Ultra},
    {'onePlus8Pro': Devices.android.onePlus8Pro},
    {'sonyXperia1II': Devices.android.sonyXperia1II},
  ],
  'windows': [
    {'laptop-': Devices.windows.laptop},
    {'wideMonitor___': Devices.windows.wideMonitor},
  ],
  'macOS': [
    {'laptop--': Devices.macOS.macBookPro},
    {'wideMonito__': Devices.macOS.wideMonitor},
  ],
  'linux': [
    {'laptop---': Devices.linux.laptop},
    {'wideMonitor_': Devices.linux.wideMonitor},
  ],
};
