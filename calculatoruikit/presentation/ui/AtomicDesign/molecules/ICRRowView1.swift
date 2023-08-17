//
//  RowView.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 11/08/23.
//

import UIKit

// MARK: - Class
class ICRRowView1: UIStackView, AtomStackView  {

    // MARK: - Variables
    private var atoms:[AtomStackView] = []

    lazy var btnOperationAC: ICRButton = {
        let btn = ICRButton(titleText: "AC",eventHandler: self.operatorAC, bgdColor: .icrGray)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private func btnOperationACConstraints() -> ICRButton{
        btnOperationAC.heightAnchor.constraint(equalTo: btnOperationAC.widthAnchor, multiplier: 1).isActive = true
        return btnOperationAC
    }

    private func operatorAC(){
        print("operator AC")
        //clear()
        btnOperationAC.shine()
    }

    lazy var btnOperationAddSubt: ICRButton = {
        let btn = ICRButton(titleText: "+/-",eventHandler: self.operatorPlusMinus, bgdColor: .icrGray)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private func btnOperationAddSubtConstraints() -> ICRButton{
        btnOperationAddSubt.heightAnchor.constraint(equalTo: btnOperationAddSubt.widthAnchor, multiplier: 1).isActive = true
        return btnOperationAddSubt
    }

    @objc func operatorPlusMinus(){
        print("operator Plus Minus")
        /*temp = temp * (-1)
        total = temp
        lblResult.text = printFormatter.string(from: NSNumber(value: temp))*/
        btnOperationAddSubt.shine()
    }

    lazy var btnPercentage: ICRButton = {
        let btn = ICRButton(titleText: "%",eventHandler: self.operatorPercentage, bgdColor: .icrGray)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private func btnPercentageConstraints() -> ICRButton {
        //self.addArrangedSubview(btnPercentage)
        btnPercentage.heightAnchor.constraint(equalTo: btnPercentage.widthAnchor, multiplier: 1).isActive = true
        return btnPercentage
    }

    @objc func operatorPercentage(){
        print("operator Percentage")
        /*if operation != .percent{
            result()
        }
        operating = true
        operation = .percent
        result()*/
        btnPercentage.shine()
    }

    lazy var btnDivision: ICRButton = {
        let btn = ICRButton(titleText: "÷",eventHandler: self.operatorDivision, bgdColor: .icrOrange)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private func btnDivisionConstraints() -> ICRButton {
        btnDivision.heightAnchor.constraint(equalTo: btnDivision.widthAnchor, multiplier: 1).isActive = true
        return btnDivision
    }

    @objc func operatorDivision(){
        print("operator Division")
        /*result()
        operating = true
        operation = .division*/
        btnDivision.shine()
    }

    // MARK: - Functions Override
    func addToStackView(_ stackView: UIStackView) {
        addAtom()
        for atom in atoms {
            atom.addToStackView(self)
        }
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 20
        stackView.addArrangedSubview(self)
    }

    // MARK: - Functions private
    private func addAtom() {
        atoms.append(btnOperationACConstraints())
        atoms.append(btnOperationAddSubtConstraints())
        atoms.append(btnPercentageConstraints())
        atoms.append(btnDivisionConstraints())
    }
}
