//
//  ViewController.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 03/01/23.
//

import UIKit

class CalculatorController: UIViewController {
    
    private lazy var stkMainContent:UIStackView = {
        let stk = UIStackView()
        stk.axis = .vertical
        stk.alignment = .fill
        stk.distribution = .fill
        stk.spacing = 20
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private func stkMainContentConstraints(){
        view.addSubview(stkMainContent)
        stkMainContent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stkMainContent.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        stkMainContent.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    }
    
    private lazy var lblNumbers:UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.font = .systemFont(ofSize: 100, weight: .light)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private func lblNumbersConstraints(){
        view.addSubview(lblNumbers)
        lblNumbers.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        lblNumbers.bottomAnchor.constraint(equalTo: stkMainContent.topAnchor, constant: -40).isActive = true
        lblNumbers.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    }
    
    private lazy var stkHorizontal1:UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.alignment = .fill
        stk.distribution = .fill
        stk.spacing = 20
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private func stkHorizontal1Constraints(){
        stkMainContent.addArrangedSubview(stkHorizontal1)
        btn1Constraints()
        btn2Constraints()
        btn3Constraints()
        btn4Constraints()
    }
    
    private lazy var btn1:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn1Constraints(){
        stkHorizontal1.addArrangedSubview(btn1)
        btn1.heightAnchor.constraint(equalTo: btn1.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn2:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn2Constraints(){
        stkHorizontal1.addArrangedSubview(btn2)
        btn2.heightAnchor.constraint(equalTo: btn2.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn3:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn3Constraints(){
        stkHorizontal1.addArrangedSubview(btn3)
        btn3.heightAnchor.constraint(equalTo: btn3.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn4:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn4Constraints(){
        stkHorizontal1.addArrangedSubview(btn4)
        btn4.heightAnchor.constraint(equalTo: btn4.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var stkHorizontal2:UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.alignment = .fill
        stk.distribution = .fill
        stk.spacing = 20
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private func stkHorizontal2Constraints(){
        stkMainContent.addArrangedSubview(stkHorizontal2)
        btn5Constraints()
        btn6Constraints()
        btn7Constraints()
        btn8Constraints()
    }
    
    private lazy var btn5:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn5Constraints(){
        stkHorizontal2.addArrangedSubview(btn5)
        btn5.heightAnchor.constraint(equalTo: btn5.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn6:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn6Constraints(){
        stkHorizontal2.addArrangedSubview(btn6)
        btn6.heightAnchor.constraint(equalTo: btn6.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn7:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn7Constraints(){
        stkHorizontal2.addArrangedSubview(btn7)
        btn7.heightAnchor.constraint(equalTo: btn7.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn8:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn8Constraints(){
        stkHorizontal2.addArrangedSubview(btn8)
        btn8.heightAnchor.constraint(equalTo: btn8.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var stkHorizontal3:UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.alignment = .fill
        stk.distribution = .fill
        stk.spacing = 20
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private func stkHorizontal3Constraints(){
        stkMainContent.addArrangedSubview(stkHorizontal3)
        btn9Constraints()
        btn10Constraints()
        btn11Constraints()
        btn12Constraints()
    }
    
    private lazy var btn9:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn9Constraints(){
        stkHorizontal3.addArrangedSubview(btn9)
        btn9.heightAnchor.constraint(equalTo: btn9.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn10:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn10Constraints(){
        stkHorizontal3.addArrangedSubview(btn10)
        btn10.heightAnchor.constraint(equalTo: btn10.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn11:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn11Constraints(){
        stkHorizontal3.addArrangedSubview(btn11)
        btn11.heightAnchor.constraint(equalTo: btn11.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn12:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn12Constraints(){
        stkHorizontal3.addArrangedSubview(btn12)
        btn12.heightAnchor.constraint(equalTo: btn12.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var stkHorizontal4:UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.alignment = .fill
        stk.distribution = .fill
        stk.spacing = 20
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private func stkHorizontal4Constraints(){
        stkMainContent.addArrangedSubview(stkHorizontal4)
        btn13Constraints()
        btn14Constraints()
        btn15Constraints()
        btn16Constraints()
    }
    
    private lazy var btn13:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn13Constraints(){
        stkHorizontal4.addArrangedSubview(btn13)
        btn13.heightAnchor.constraint(equalTo: btn13.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn14:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn14Constraints(){
        stkHorizontal4.addArrangedSubview(btn14)
        btn14.heightAnchor.constraint(equalTo: btn14.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn15:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn15Constraints(){
        stkHorizontal4.addArrangedSubview(btn15)
        btn15.heightAnchor.constraint(equalTo: btn15.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn16:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn16Constraints(){
        stkHorizontal4.addArrangedSubview(btn16)
        btn16.heightAnchor.constraint(equalTo: btn16.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var stkHorizontal5:UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.alignment = .fill
        stk.distribution = .fillEqually
        stk.spacing = 20
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private func stkHorizontal5Constraints(){
        stkMainContent.addArrangedSubview(stkHorizontal5)
        stkHorizontalInternal1Constraints()
        stkHorizontalInternal2Constraints()
    }
    
    private lazy var stkHorizontalInternal1:UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.alignment = .fill
        stk.distribution = .fill
        //stk.spacing = 20
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private func stkHorizontalInternal1Constraints(){
        stkHorizontal5.addArrangedSubview(stkHorizontalInternal1)
        btn17Constraints()
    }
    
    private lazy var btn17:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn17Constraints(){
        stkHorizontalInternal1.addArrangedSubview(btn17)
    }
    
    private lazy var stkHorizontalInternal2:UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        stk.alignment = .fill
        stk.distribution = .fillEqually
        stk.spacing = 20
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    private func stkHorizontalInternal2Constraints(){
        stkHorizontal5.addArrangedSubview(stkHorizontalInternal2)
        btn18Constraints()
        btn19Constraints()
    }
    
    private lazy var btn18:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn18Constraints(){
        stkHorizontalInternal2.addArrangedSubview(btn18)
        btn18.heightAnchor.constraint(equalTo: btn18.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btn19:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btn19Constraints(){
        stkHorizontalInternal2.addArrangedSubview(btn19)
        btn19.heightAnchor.constraint(equalTo: btn19.widthAnchor, multiplier: 1).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        stkMainContentConstraints()
        lblNumbersConstraints()
        stkHorizontal1Constraints()
        stkHorizontal2Constraints()
        stkHorizontal3Constraints()
        stkHorizontal4Constraints()
        
        stkHorizontal5Constraints()
    }

}

