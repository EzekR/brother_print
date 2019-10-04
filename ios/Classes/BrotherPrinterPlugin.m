#import "BrotherPrinterPlugin.h"
#import <brother_printer/brother_printer-Swift.h>

@implementation BrotherPrinterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBrotherPrinterPlugin registerWithRegistrar:registrar];
}
@end
