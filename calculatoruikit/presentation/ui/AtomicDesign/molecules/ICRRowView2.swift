//
//  ICRRowView2.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 16/08/23.
//

import UIKit

// MARK: - Class
class ICRRowView2: UIStackView, AtomStackView {

    // MARK: - Variables
    private var atoms:[AtomStackView] = []

    lazy var btnSeven: ICRButton = {
        let btn = ICRButton(titleText: "7")
        btn.tag = 7
        return btn
    }()

    private func btnSevenConstraints() -> ICRButton{
        btnSeven.heightAnchor.constraint(equalTo: btnSeven.widthAnchor, multiplier: 1).isActive = true
        return btnSeven
    }

    lazy var btnEight: ICRButton = {
        let btn = ICRButton(titleText: "8")
        btn.tag = 8
        return btn
    }()

    private func btnEightConstraints() -> ICRButton{
        btnEight.heightAnchor.constraint(equalTo: btnEight.widthAnchor, multiplier: 1).isActive = true
        return btnEight
    }

    lazy var btnNine: ICRButton = {
        let btn = ICRButton(titleText: "9")
        btn.tag = 9
        return btn
    }()

    private func btnNineConstraints() -> ICRButton{
        btnNine.heightAnchor.constraint(equalTo: btnNine.widthAnchor, multiplier: 1).isActive = true
        return btnNine
    }

    lazy var btnMultiplication: ICRButton = {
        let btn = ICRButton(titleText: "x", eventHandler: self.operatorMultiplication, bgdColor: .icrOrange)
        return btn
    }()

    private func btnMultiplicationConstraints() -> ICRButton{
        btnMultiplication.heightAnchor.constraint(equalTo: btnMultiplication.widthAnchor, multiplier: 1).isActive = true
        return btnMultiplication
    }

    // MARK: - Functions Override
    func addToStackView(_ stackView: UIStackView) {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 20
        addAtom()
        for atom in atoms {
            atom.addToStackView(self)
        }
        stackView.addArrangedSubview(self)
    }

    // MARK: - Functions private
    private func addAtom() {
        atoms.append(btnSevenConstraints())
        atoms.append(btnEightConstraints())
        atoms.append(btnNineConstraints())
        atoms.append(btnMultiplicationConstraints())
    }
    
    @objc private func operatorMultiplication() {
        print("operator Multiplication")
    }
}
