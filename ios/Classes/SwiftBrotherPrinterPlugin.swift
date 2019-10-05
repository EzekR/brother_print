import Flutter
import UIKit
import BRPtouchPrinterKit

public class SwiftBrotherPrinterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "brother_printer", binaryMessenger: registrar.messenger())
    let instance = SwiftBrotherPrinterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "printImage" {
        let args = call.arguments! as! [String: Any]
        let str = args["data"] as? String ?? ""
        print(str)
        let dataDecoded : Data = Data(base64Encoded: str, options: .ignoreUnknownCharacters)!
        guard let decodedimage = UIImage(data: dataDecoded) else {return}
        printImage(image: decodedimage)
    }
    result("iOS " + UIDevice.current.systemVersion)
  }

  func connectPrinter() {
    guard let printer = BRPtouchPrinter(printerName: "PT-P900W", interface: .WLAN) else {
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

  func printImage(image: UIImage) {
      // Specify printer
      let printer = BRPtouchPrinter(printerName: "PT-P900W", interface: CONNECTION_TYPE.WLAN)!
      printer.setIPAddress("192.168.118.1")

      // Print Settings
      let settings = BRPtouchPrintInfo()
      settings.strPaperName = "36mm"
      settings.nPrintMode = PRINT_FIT_TO_PAGE
      settings.nAutoCutFlag = OPTION_AUTOCUT
      printer.setPrintInfo(settings)

      // Connect, then print
      if printer.startCommunication() {
        print("connected")
        print(image)
          let errorCode = printer.print(image.cgImage, copy: 1)
          if errorCode != ERROR_NONE_ {
              print("ERROR - \(errorCode)")
          }
          printer.endCommunication()
      }
  }
}
