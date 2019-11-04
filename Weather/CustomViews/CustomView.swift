//
//  File.swift
//  Weather
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  override func prepareForInterfaceBuilder() {
    self.setupView()
  }
  override func awakeFromNib() {
    self.setupView()
  }
  
  // MARK: - setup view
  private func setupView() {
    self.layer.cornerRadius = 15
  }
}
