//
//  ICRRowView4.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 16/08/23.
//

import UIKit

class ICRRowView4: UIStackView, AtomStackView {

    // MARK: - Variables
    private var atoms:[AtomStackView] = []

    lazy var btnOne: ICRButton = {
        let btn = ICRButton(titleText: "1")
        btn.tag = 1
        return btn
    }()

    private func btnOneConstraints() -> ICRButton{
        btnOne.heightAnchor.constraint(equalTo: btnOne.widthAnchor, multiplier: 1).isActive = true
        return btnOne
    }

    lazy var btnTwo: ICRButton = {
        let btn = ICRButton(titleText: "2")
        btn.tag = 2
        return btn
    }()

    private func btnTwoConstraints() -> ICRButton{
        btnTwo.heightAnchor.constraint(equalTo: btnTwo.widthAnchor, multiplier: 1).isActive = true
        return btnTwo
    }

    lazy var btnThree: ICRButton = {
        let btn = ICRButton(titleText: "3")
        btn.tag = 3
        return btn
    }()

    private func btnThreeConstraints() -> ICRButton{
        btnThree.heightAnchor.constraint(equalTo: btnThree.widthAnchor, multiplier: 1).isActive = true
        return btnThree
    }

    lazy var btnAddition: ICRButton = {
        let btn = ICRButton(titleText: "+", eventHandler: self.operatorAddition, bgdColor: .icrOrange)
        return btn
    }()

    private func btnAdditionConstraints() -> ICRButton{
        btnAddition.heightAnchor.constraint(equalTo: btnAddition.widthAnchor, multiplier: 1).isActive = true
        return btnAddition
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
        atoms.append(btnOneConstraints())
        atoms.append(btnTwoConstraints())
        atoms.append(btnThreeConstraints())
        atoms.append(btnAdditionConstraints())
    }
    
    @objc private func operatorAddition(){
        print("operator +")
    }
}
