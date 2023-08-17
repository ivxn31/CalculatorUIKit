//
//  ICRRowView5.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 16/08/23.
//

import UIKit

class ICRRowView5: UIStackView, AtomStackView {
    
    // MARK: - Variables
    private var atoms:[AtomStackView] = []

    lazy var horizontalInternal1: ICRRowInternal1 = {
        let btn = ICRRowInternal1()
        return btn
    }()

    lazy var horizontalInternal2: ICRRowInternal2 = {
        let btn = ICRRowInternal2()
        return btn
    }()

    // MARK: - Functions Override
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

    // MARK: - Functions private
    private func addAtom() {
        atoms.append(horizontalInternal1)
        atoms.append(horizontalInternal2)
    }
}
