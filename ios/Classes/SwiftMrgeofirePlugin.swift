import Flutter
import UIKit

public class SwiftMrgeofirePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mrgeofire", binaryMessenger: registrar.messenger())
    let instance = SwiftMrgeofirePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getPlatformVersion") {
           result("iOS " + UIDevice.current.systemVersion)
       }
       else if (call.method == "showAlertDialog") {
           DispatchQueue.main.async {
              let alert = UIAlertController(title: "Alert", message: "Hi, My name is flutter", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
              UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
           }
       }
  }
}
