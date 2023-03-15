//
//  UIImageURL.swift
//  ValorantConsultant
//
//  Created by Miguel Correa Avila on 15/3/23.
//

import SwiftUI
import UIKit
    
extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
