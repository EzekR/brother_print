#import "BrotherPrinterPlugin.h"

@implementation BrotherPrinterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBrotherPrinterPlugin registerWithRegistrar:registrar];
}
@end
