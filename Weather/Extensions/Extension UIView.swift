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


    func addSeparatorLine(color: UIColor, leading: Int, trailing: Int){
        let line = UIView()
        addSubview(line)
        line.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(leading)
            make.trailing.equalToSuperview().inset(trailing)
        }
        
        line.backgroundColor = color
    }
 
    func setShadow(color: UIColor = .gray, opacity: Float = 0.5, offSet: CGSize = .zero, radius: CGFloat = 15) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
    
    func customCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}

