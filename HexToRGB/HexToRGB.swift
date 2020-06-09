//
//  HexToRGB.swift
//  HexToRGB
//
//  Created by Hongli Yu on 2020/6/9.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

class HexToRGB {

  static func convert(hex: String) -> Result<String, Error> {
    guard hex.hasPrefix("#") else {
      return .failure(ConvertError.format)
    }
    let start = hex.index(hex.startIndex, offsetBy: 1)
    let hexColor = String(hex[start...])
    guard hexColor.count == 6 else {
      return .failure(ConvertError.length)
    }
    let scanner = Scanner(string: hexColor)
    var hexValue: UInt64 = 0
    guard scanner.scanHexInt64(&hexValue) else {
      return .failure(ConvertError.scanner)
    }
    let red = CGFloat((hexValue & 0xFF0000) >> 16)
    let green = CGFloat((hexValue & 0x00FF00) >> 8)
    let blue = CGFloat(hexValue & 0x0000FF)
    let alpha = CGFloat(1.0)
    let ret = """
    rgba: \
    <\(String(format: "%.1f", red)), \
    \(String(format: "%.1f", green)), \
    \(String(format: "%.1f", blue)), \
    \(String(format: "%.1f", alpha))>
    """
    return .success(ret)
  }

}

enum ConvertError: Error {

  case format
  case length
  case scanner

  var message: String {
    get {
      switch self {
      case .format:
        return "Error: Please add '#' infront of the string (e.x. #FFFFFF)"
      case .length:
        return "Error: Hex's length should be 7 (e.x. #FFFFFF)"
      case .scanner:
        return "Error: unknown error occurred in scanning hex"
      }
    }
  }

}
