//
//  ICRRowView3.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 16/08/23.
//

import UIKit

class ICRRowView3: UIStackView, AtomStackView {

    // MARK: - Variables
    private var atoms:[AtomStackView] = []

    lazy var btnFour: ICRButton = {
        let btn = ICRButton(titleText: "4")
        btn.tag = 4
        return btn
    }()

    private func btnFourConstraints() -> ICRButton{
        btnFour.heightAnchor.constraint(equalTo: btnFour.widthAnchor, multiplier: 1).isActive = true
        return btnFour
    }

    lazy var btnFive: ICRButton = {
        let btn = ICRButton(titleText: "5")
        btn.tag = 5
        return btn
    }()

    private func btnFiveConstraints() -> ICRButton{
        btnFive.heightAnchor.constraint(equalTo: btnFive.widthAnchor, multiplier: 1).isActive = true
        return btnFive
    }

    lazy var btnSix: ICRButton = {
        let btn = ICRButton(titleText: "6")
        btn.tag = 6
        return btn
    }()

    private func btnSixConstraints() -> ICRButton{
        btnSix.heightAnchor.constraint(equalTo: btnSix.widthAnchor, multiplier: 1).isActive = true
        return btnSix
    }

    lazy var btnSubtraction: ICRButton = {
        let btn = ICRButton(titleText: "-", eventHandler: self.operatorSubstraction, bgdColor: .icrOrange)
        return btn
    }()

    private func btnSubtractionConstraints() -> ICRButton{
        btnSubtraction.heightAnchor.constraint(equalTo: btnSubtraction.widthAnchor, multiplier: 1).isActive = true
        return btnSubtraction
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
        atoms.append(btnFourConstraints())
        atoms.append(btnFiveConstraints())
        atoms.append(btnSixConstraints())
        atoms.append(btnSubtractionConstraints())
    }
    
    @objc private func operatorSubstraction() {
        print("operator Substraction")
    }
}
