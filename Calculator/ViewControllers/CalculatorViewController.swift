//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Johan Wejdenstolpe on 2021-06-12.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet private weak var extraButtonsStackview: UIStackView!
    @IBOutlet private weak var numberStackView: UIStackView!
    @IBOutlet private weak var calculatorView: UITextField!
    
    private var viewModel: CalculatorViewModel
    
    init(viewModel: CalculatorViewModel) {
        self.viewModel = viewModel
        let nib = String(describing: CalculatorViewController.self)
        super.init(nibName: nib, bundle: nil)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.calculationClosure = calculationClosure(result:)
        updateView()
    }
    
    private func calculationClosure(result: String) {
        calculatorView.text = result
    }
    
    @IBAction func buttonPressed(_ sender: CalculatorButton) {
        viewModel.buttonPressed(button: sender)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func updateView() {
        let isIpad = UIDevice.current.userInterfaceIdiom == .pad
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            extraButtonsStackview?.isHidden = isIpad ? false : true
            numberStackView?.axis = .vertical
            viewModel.state = isIpad ? .advanced : .basic
        case .landscapeLeft, .landscapeRight:
            extraButtonsStackview?.isHidden = false
            numberStackView?.axis = .horizontal
            viewModel.state = .advanced
        default:
            return
        }
    }
}

extension CalculatorViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateView()
    }
}
