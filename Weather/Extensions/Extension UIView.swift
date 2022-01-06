//
//  Extension UIView.swift
//  Weather
//
//  Created by lion on 3.01.22.
//

import Foundation
import UIKit

extension UIView {
    func setCornerRadius(with radius: Double) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}



extension UITableViewCell {
    func addSeparatorLine(color: UIColor, width: Int, height: Int){
        let lineFrame = CGRect(x: 0, y: 0, width: width, height: height)
        let line = UIView(frame: lineFrame)
        line.backgroundColor = color
        addSubview(line)
    }
}
