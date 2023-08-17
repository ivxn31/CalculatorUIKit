//
//  CalculatorUIView.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 07/08/23.
//

import UIKit

class CalculatorScreen {

    private var view: UIView!

    private lazy var stkMainContent: ICRColumView = {
        let stk = ICRColumView()
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()

    private func stkMainContentConstraints() {
        view.addSubview(stkMainContent)
        stkMainContent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stkMainContent.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        stkMainContent.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    }

    private lazy var lblResult: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.font = .systemFont(ofSize: 100, weight: .light)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private func lblResultConstraints() {
        view.addSubview(lblResult)
        lblResult.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        lblResult.bottomAnchor.constraint(equalTo: stkMainContent.topAnchor, constant: -40).isActive = true
        lblResult.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    }

    init(_ view: UIView) {
        self.view = view
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .black
        stkMainContentConstraints()
        lblResultConstraints()
    }
}
