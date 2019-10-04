import Flutter
import UIKit
import ../Assets/BRPtouchPrinterKit

public class SwiftBrotherPrinterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "brother_printer", binaryMessenger: registrar.messenger())
    let instance = SwiftBrotherPrinterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  func connectPrinter() {
    guard let printer = BRPtouchPrinter(printerName: "PT-P900W", interface: .WLAN) else {
        print("Unknown printer")
        return
    }
    printer.setIPAddress("192.168.118.1")
    if printer.startCommunication() {
        // Put any code to use printer
        print("printer connected")
        printer.endCommunication()
    } else {
        print("Failed to connect")
    }
  }
}
