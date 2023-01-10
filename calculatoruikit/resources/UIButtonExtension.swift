//
//  UIButtonExtension.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 09/01/23.
//

import UIKit

// MARK: - UIButton Extension
extension UIButton {
    
    // Borde redondo
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    // Brilla
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
}
