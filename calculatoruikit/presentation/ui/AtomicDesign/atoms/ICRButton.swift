//
//  ICRButton.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 16/08/23.
//

import UIKit

class ICRButton: UIButton, AtomStackView {

    private var titleText: String?
    private var actionHandler: ( () -> Void )?
    private var bgdColor: UIColor = .icrBlack

    init(titleText: String, eventHandler: (() -> Void)? = nil, bgdColor:UIColor = UIColor.icrBlack) {
        self.actionHandler = eventHandler
        super.init(frame: .zero)
        self.titleText = titleText
        self.bgdColor = bgdColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addToStackView(_ stackView: UIStackView) {
        self.setTitle(self.titleText, for: .normal)
        self.backgroundColor = self.bgdColor
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        self.addTarget(self, action: #selector(eventTap), for: .touchUpInside)
        stackView.addArrangedSubview(self)
    }

    @objc private func eventTap() {
        actionHandler?()
    }
}
