//
//  ICRColumView.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 16/08/23.
//

import UIKit

class ICRColumView: UIStackView, AtomStackView {
    
    private var atoms:[AtomStackView] = []

    private lazy var horizontalRow1: ICRRowView1 = {
        let stk = ICRRowView1()
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()

    private lazy var horizontalRow2: ICRRowView2 = {
        let stk = ICRRowView2()
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private lazy var horizontalRow3: ICRRowView3 = {
        let stk = ICRRowView3()
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()

    private lazy var horizontalRow4: ICRRowView4 = {
        let stk = ICRRowView4()
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private lazy var horizontalRow5: ICRRowView5 = {
        let stk = ICRRowView5()
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewConfig()
        addToStackView(self)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToStackView(_ stackView: UIStackView) {
        addAtom()
        for atom in atoms {
            atom.addToStackView(self)
        }
    }

    private func viewConfig() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 20
    }

    // MARK: - Functions private
    private func addAtom() {
        atoms.append(horizontalRow1)
        atoms.append(horizontalRow2)
        atoms.append(horizontalRow3)
        atoms.append(horizontalRow4)
        atoms.append(horizontalRow5)
    }
}
