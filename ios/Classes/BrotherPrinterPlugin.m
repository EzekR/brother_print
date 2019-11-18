#import "BrotherPrinterPlugin.h"
#if __has_include(<brother_printer/brother_printer-Swift.h>)
#import <brother_printer/brother_printer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "brother_printer-Swift.h"
#endif

@implementation BrotherPrinterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBrotherPrinterPlugin registerWithRegistrar:registrar];
}
@end
