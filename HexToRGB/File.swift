//
//  File.swift
//  HexToRGB
//
//  Created by Hongli Yu on 2020/6/9.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

class File {

  static func readTextFromDisk(path: String) throws -> String {
    let url = URL(fileURLWithPath: path)
    let ret = try String(contentsOf: url, encoding: .utf8)
    return ret
  }

  static func writeTextToDisk(text: String, path: String) throws {
    let url = URL(fileURLWithPath: path)
    try text.write(to: url, atomically: false, encoding: .utf8)
  }

}
