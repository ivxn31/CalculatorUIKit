//
//  ICRRowInternal2.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 16/08/23.
//

import UIKit

class ICRRowInternal2: UIStackView , AtomStackView {
    
    // MARK: - Variables
    private var atoms:[AtomStackView] = []

    lazy var btnDecimal: ICRButton = {
        let btn = ICRButton(titleText: ".")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private func btnDecimalConstraints() -> ICRButton{
        btnDecimal.heightAnchor.constraint(equalTo: btnDecimal.widthAnchor, multiplier: 1).isActive = true
        return btnDecimal
    }
    
    private lazy var btnResultOperation: ICRButton = {
        let btn = ICRButton(titleText: "=", eventHandler: self.operatorResult, bgdColor: .icrOrange)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnResultOperationConstraints() -> ICRButton{
        btnResultOperation.heightAnchor.constraint(equalTo: btnResultOperation.widthAnchor, multiplier: 1).isActive = true
        return btnResultOperation
    }
    
    @objc func operatorResult(){
        print("operator =")
        btnResultOperation.shine()
    }
    
    func addToStackView(_ stackView: UIStackView) {
        addAtom()
        for atom in atoms {
            atom.addToStackView(self)
        }
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 20
        stackView.addArrangedSubview(self)
    }
    
    private func addAtom() {
        atoms.append(btnDecimalConstraints())
        atoms.append(btnResultOperationConstraints())
    }
}
