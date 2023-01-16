//
//  ViewController.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 03/01/23.
//

import UIKit

class CalculatorController: UIViewController {
    
    private var total: Double = 0
    private var temp: Double = 0
    private var operating =  false
    private var decimal = false
    private var operation:Operations = .none
    
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLength = 9
    private let kMaxValue: Double = 999999999
    private let kMinValue: Double = 0.00000001
    
    private let auxFormatter:NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
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
    
    private lazy var lblResult:UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.font = .systemFont(ofSize: 100, weight: .light)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private func lblResultConstraints(){
        view.addSubview(lblResult)
        lblResult.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        lblResult.bottomAnchor.constraint(equalTo: stkMainContent.topAnchor, constant: -40).isActive = true
        lblResult.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
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
        btnOperationACConstraints()
        btnOperationAddSubtConstraints()
        btnPercentageConstraints()
        btnDivisionConstraints()
    }
    
    private lazy var btnOperationAC:UIButton = {
        let btn = UIButton()
        btn.setTitle("AC", for: .normal)
        btn.backgroundColor = UIColor(named: "grayButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.addTarget(self, action: #selector(operatorAC), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnOperationACConstraints(){
        stkHorizontal1.addArrangedSubview(btnOperationAC)
        btnOperationAC.heightAnchor.constraint(equalTo: btnOperationAC.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func operatorAC(){
        print("operator AC")
        clear()
        btnOperationAC.shine()
    }
    
    private lazy var btnOperationAddSubt:UIButton = {
        let btn = UIButton()
        btn.setTitle("+/-", for: .normal)
        btn.backgroundColor = UIColor(named: "grayButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.addTarget(self, action: #selector(operatorPlusMinus), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnOperationAddSubtConstraints(){
        stkHorizontal1.addArrangedSubview(btnOperationAddSubt)
        btnOperationAddSubt.heightAnchor.constraint(equalTo: btnOperationAddSubt.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func operatorPlusMinus(){
        print("operator Plus Minus")
        temp = temp * (-1)
        lblResult.text = printFormatter.string(from: NSNumber(value: temp))
        btnOperationAddSubt.shine()
    }
    
    private lazy var btnPercentage:UIButton = {
        let btn = UIButton()
        btn.setTitle("%", for: .normal)
        btn.backgroundColor = UIColor(named: "grayButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.addTarget(self, action: #selector(operatorPercentage), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnPercentageConstraints(){
        stkHorizontal1.addArrangedSubview(btnPercentage)
        btnPercentage.heightAnchor.constraint(equalTo: btnPercentage.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func operatorPercentage(){
        print("operator Percentage")
        if operation != .percent{
            result()
        }
        operating = true
        operation = .percent
        result()
        btnPercentage.shine()
    }
    
    private lazy var btnDivision:UIButton = {
        let btn = UIButton()
        btn.setTitle("÷", for: .normal)
        btn.backgroundColor = UIColor(named: "orangeButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.addTarget(self, action: #selector(operatorDivision), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnDivisionConstraints(){
        stkHorizontal1.addArrangedSubview(btnDivision)
        btnDivision.heightAnchor.constraint(equalTo: btnDivision.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func operatorDivision(){
        print("operator Division")
        result()
        operating = true
        operation = .division
        btnDivision.shine()
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
        btnSevenConstraints()
        btnEightConstraints()
        btnNineConstraints()
        btnMultiplicationConstraints()
    }
    
    private lazy var btnSeven:UIButton = {
        let btn = UIButton()
        btn.setTitle("7", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 7
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnSevenConstraints(){
        stkHorizontal2.addArrangedSubview(btnSeven)
        btnSeven.heightAnchor.constraint(equalTo: btnSeven.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btnEight:UIButton = {
        let btn = UIButton()
        btn.setTitle("8", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 8
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnEightConstraints(){
        stkHorizontal2.addArrangedSubview(btnEight)
        btnEight.heightAnchor.constraint(equalTo: btnEight.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btnNine:UIButton = {
        let btn = UIButton()
        btn.setTitle("9", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 9
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnNineConstraints(){
        stkHorizontal2.addArrangedSubview(btnNine)
        btnNine.heightAnchor.constraint(equalTo: btnNine.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btnMultiplication:UIButton = {
        let btn = UIButton()
        btn.setTitle("x", for: .normal)
        btn.backgroundColor = UIColor(named: "orangeButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.addTarget(self, action: #selector(operatorMultiplication), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnMultiplicationConstraints(){
        stkHorizontal2.addArrangedSubview(btnMultiplication)
        btnMultiplication.heightAnchor.constraint(equalTo: btnMultiplication.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func operatorMultiplication(){
        print("operator Multiplication")
        result()
        operating = true
        operation = .multiplication
        btnMultiplication.shine()
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
        btnFourConstraints()
        btnFiveConstraints()
        btnSixConstraints()
        btnSubtractionConstraints()
    }
    
    private lazy var btnFour:UIButton = {
        let btn = UIButton()
        btn.setTitle("4", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 4
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnFourConstraints(){
        stkHorizontal3.addArrangedSubview(btnFour)
        btnFour.heightAnchor.constraint(equalTo: btnFour.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btnFive:UIButton = {
        let btn = UIButton()
        btn.setTitle("5", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 5
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnFiveConstraints(){
        stkHorizontal3.addArrangedSubview(btnFive)
        btnFive.heightAnchor.constraint(equalTo: btnFive.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btnSix:UIButton = {
        let btn = UIButton()
        btn.setTitle("6", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 6
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnSixConstraints(){
        stkHorizontal3.addArrangedSubview(btnSix)
        btnSix.heightAnchor.constraint(equalTo: btnSix.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btnSubtraction:UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.backgroundColor = UIColor(named: "orangeButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.addTarget(self, action: #selector(operatorSubstraction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnSubtractionConstraints(){
        stkHorizontal3.addArrangedSubview(btnSubtraction)
        btnSubtraction.heightAnchor.constraint(equalTo: btnSubtraction.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func operatorSubstraction(){
        print("operator -")
        result()
        operating = true
        operation = .subtraction
        btnSubtraction.shine()
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
        btnOneConstraints()
        btnTwoConstraints()
        btnThreeConstraints()
        btnAdditionConstraints()
    }
    
    private lazy var btnOne:UIButton = {
        let btn = UIButton()
        btn.setTitle("1", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 1
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnOneConstraints(){
        stkHorizontal4.addArrangedSubview(btnOne)
        btnOne.heightAnchor.constraint(equalTo: btnOne.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btnTwo:UIButton = {
        let btn = UIButton()
        btn.setTitle("2", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 2
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnTwoConstraints(){
        stkHorizontal4.addArrangedSubview(btnTwo)
        btnTwo.heightAnchor.constraint(equalTo: btnTwo.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btnThree:UIButton = {
        let btn = UIButton()
        btn.setTitle("3", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 3
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnThreeConstraints(){
        stkHorizontal4.addArrangedSubview(btnThree)
        btnThree.heightAnchor.constraint(equalTo: btnThree.widthAnchor, multiplier: 1).isActive = true
    }
    
    private lazy var btnAddition:UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.backgroundColor = UIColor(named: "orangeButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.addTarget(self, action: #selector(operatorAddition), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnAdditionConstraints(){
        stkHorizontal4.addArrangedSubview(btnAddition)
        btnAddition.heightAnchor.constraint(equalTo: btnAddition.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func operatorAddition(){
        print("operator +")
        result()
        operating = true
        operation = .addition
        btnAddition.shine()
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
        btnZeroConstraints()
    }
    
    private lazy var btnZero:UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.tag = 0
        btn.addTarget(self, action: #selector(operatorNumber), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnZeroConstraints(){
        stkHorizontalInternal1.addArrangedSubview(btnZero)
    }
    
    @objc func operatorNumber(_ event: UIButton){
        print("operator Number \(event.tag)")
        event.shine()
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
        btnDecimalConstraints()
        btnResultOperationConstraints()
    }
    
    private lazy var btnDecimal:UIButton = {
        let btn = UIButton()
        //btn.setTitle(".", for: .normal)
        btn.backgroundColor = UIColor(named: "blackButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.addTarget(self, action: #selector(operatorPointDecimal), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnDecimalConstraints(){
        stkHorizontalInternal2.addArrangedSubview(btnDecimal)
        btnDecimal.heightAnchor.constraint(equalTo: btnDecimal.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func operatorPointDecimal(){
        print("operator .")
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength{
            return
        }
        lblResult.text = lblResult.text! + kDecimalSeparator
        decimal = true
        btnDecimal.shine()
    }
    
    private lazy var btnResultOperation:UIButton = {
        let btn = UIButton()
        btn.setTitle("=", for: .normal)
        btn.backgroundColor = UIColor(named: "orangeButton")
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        btn.addTarget(self, action: #selector(operatorResult), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func btnResultOperationConstraints(){
        stkHorizontalInternal2.addArrangedSubview(btnResultOperation)
        btnResultOperation.heightAnchor.constraint(equalTo: btnResultOperation.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func operatorResult(){
        print("operator =")
        result()
        btnResultOperation.shine()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        stkMainContentConstraints()
        lblResultConstraints()
        stkHorizontal1Constraints()
        stkHorizontal2Constraints()
        stkHorizontal3Constraints()
        stkHorizontal4Constraints()
        stkHorizontal5Constraints()
        result()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        btnOperationAC.round()
        btnOperationAddSubt.round()
        btnPercentage.round()
        btnDivision.round()
        btnSeven.round()
        btnEight.round()
        btnNine.round()
        btnMultiplication.round()
        btnFour.round()
        btnFive.round()
        btnSix.round()
        btnSubtraction.round()
        btnOne.round()
        btnTwo.round()
        btnThree.round()
        btnAddition.round()
        btnZero.round()
        btnDecimal.round()
        btnDecimal.setTitle(kDecimalSeparator, for: .normal)
        btnResultOperation.round()
    }
    
    @objc private func clear(){
        operation = .none
        btnOperationAC.setTitle("AC",for: .normal)
        if temp != 0 {
            temp = 0
            lblResult.text = "0"
        }else{
            total = 0
            result()
        }
    }
    
    @objc private func result(){
        switch operation {
        case .none:
            break
        case .addition:
            total = total + temp
            break
        case .subtraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        if total <= kMaxValue || total > kMinValue {
            lblResult.text = printFormatter.string(from: NSNumber(value: total))
        }
    }
}

