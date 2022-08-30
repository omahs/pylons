// Autogenerated from Pigeon (v3.2.6), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
import Flutter

/// Generated class from Pigeon.

/// Generated class from Pigeon that represents data sent in messages.
struct NFT {
  var imageUrl: String

  static func fromMap(_ map: [String: Any?]) -> NFT? {
    let imageUrl = map["imageUrl"] as! String

    return NFT(
      imageUrl: imageUrl
    )
  }
  func toMap() -> [String: Any?] {
    return [
      "imageUrl": imageUrl
    ]
  }
}
private class CollectionsApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return NFT.fromMap(self.readValue() as! [String: Any])      
      default:
        return super.readValue(ofType: type)
      
    }
  }
}
private class CollectionsApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? NFT {
      super.writeByte(128)
      super.writeValue(value.toMap())
    } else {
      super.writeValue(value)
    }
  }
}

private class CollectionsApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return CollectionsApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return CollectionsApiCodecWriter(data: data)
  }
}

class CollectionsApiCodec: FlutterStandardMessageCodec {
  static let shared = CollectionsApiCodec(readerWriter: CollectionsApiCodecReaderWriter())
}

/// Generated class from Pigeon that represents Flutter messages that can be called from Swift.
class CollectionsApi {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger){
    self.binaryMessenger = binaryMessenger
  }
  var codec: FlutterStandardMessageCodec {
    return CollectionsApiCodec.shared
  }
  func getCollection(completion: @escaping ([NFT]) -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.CollectionsApi.getCollection", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      let result = response as! [NFT]
      completion(result)
    }
  }
}

private func wrapResult(_ result: Any?) -> [String: Any?] {
  return ["result": result]
}

private func wrapError(_ error: FlutterError) -> [String: Any?] {
  return [
    "error": [
      "code": error.code,
      "message": error.message,
      "details": error.details
    ]
  ]
}