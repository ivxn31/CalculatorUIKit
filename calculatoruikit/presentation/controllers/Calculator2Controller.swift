//
//  Calculator2ViewController.swift
//  calculatoruikit
//
//  Created by Ivan Tecpanecatl Martinez on 07/08/23.
//

import UIKit

class Calculator2Controller: UIViewController {
    
    private var calculatorScreen: CalculatorScreen!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculatorScreen = CalculatorScreen(self.view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //calculatorUIView.btnOperationAC.round()
    }
}
