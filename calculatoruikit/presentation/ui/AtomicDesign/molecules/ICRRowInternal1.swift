//
//  ICRRowInternal1.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 16/08/23.
//

import UIKit

class ICRRowInternal1: UIStackView, AtomStackView {

    // MARK: - Variables
    lazy var btnZero: ICRButton = {
        let btn = ICRButton(titleText: "0")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func addToStackView(_ stackView: UIStackView) {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fill
        btnZero.addToStackView(self)
        stackView.addArrangedSubview(self)
    }
}
