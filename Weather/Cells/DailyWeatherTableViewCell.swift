//
//  DailyWeatherTableViewCell.swift
//  Weather
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {

  @IBOutlet weak var tempratureLabel: UILabel!
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var dailyWeatherImage: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
