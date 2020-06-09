//
//  App.swift
//  HexToRGB
//
//  Created by Hongli Yu on 2020/6/9.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

class App {

  static func run() {

    for argument in CommandLine.arguments {
      switch argument {
      case "help", "-help", "--help":
        displayHelpInfos()
        return
      default: break
      }
    }

    print("Please input the file path: ")
    let originalPath = String(Console.input().filter { !" \n\t\r".contains($0) })
    var text = ""
    do {
      text = try File.readTextFromDisk(path: originalPath)
    } catch(let error) {
      print(error.localizedDescription)
      displayHelpInfos()
    }
    let hexArray = text.components(separatedBy: "\n")
      .flatMap{ $0.components(separatedBy: ",") }
      .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    let rgbaArray: [String] = hexArray.map {
      let ret = HexToRGB.convert(hex: $0)
      var output = ""
      switch ret {
      case .success(let str):
        output = str
      case .failure(let error):
        guard let error = error as? ConvertError else { return "error" }
        output = error.message
      }
      return "\($0) -> \(output)"
    }
    do {
      let outputPath = "\(originalPath)_RGBA"
      try File.writeTextToDisk(text: rgbaArray.joined(separator:"\n"), path: outputPath)
      print("Done! please check: \(outputPath)")
    } catch(let error) {
      print(error.localizedDescription)
      displayHelpInfos()
    }
  }

  private static func displayHelpInfos() {
    print("""
          \nPlease input the file path.
          Make sure the content is written with right format(#222220) with comma(,) in between each element.
          And the output file shall be located in the same directory with suffix(_RGBA).
          """)
  }

}
