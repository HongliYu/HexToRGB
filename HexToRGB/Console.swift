//
//  Console.swift
//  HexToRGB
//
//  Created by Hongli Yu on 2020/6/9.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

class Console {

  static func input() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    return NSString(data: inputData, encoding:String.Encoding.utf8.rawValue)! as String
  }

}
