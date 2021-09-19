//
//  DataParser.swift
//  BlinkistApp
//
//  Created by Decagon on 04/08/2021.
//

import Foundation

protocol dataDelegate {
  func parseJsonData(_ data: [Authors])
}

class DataParser {
  var bookDetails = [Authors]()
  
  // DELEGATE AND PROTOCOL
  var delegate: dataDelegate?
  
  func parseJSON() {
    if let resourceURL = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
      do {
        let data = try Data(contentsOf: resourceURL)
        let jsonContent = try JSONDecoder().decode([Authors].self, from: data)
//        self.bookDetails = jsonContent
        delegate?.parseJsonData(jsonContent)
      }
      catch {
        print("\(error)")
      }
    }
  }
  
  
  
  // CLOSURE PASSING
//  init() {
//    parseJSON { data in
//      self.bookDetails = data
//    }
//  }
//
//  func parseJSON(configure: ([Authors]) -> Void) {
//    if let resourceURL = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
//      do {
//        let data = try Data(contentsOf: resourceURL)
//        let jsonContent = try JSONDecoder().decode([Authors].self, from: data)
//        self.bookDetails = jsonContent
//      }
//      catch {
//        print("\(error)")
//      }
//    }
//  }
}
