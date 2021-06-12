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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
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
        case .landscapeLeft, .landscapeRight:
            extraButtonsStackview?.isHidden = false
            numberStackView?.axis = .horizontal
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
