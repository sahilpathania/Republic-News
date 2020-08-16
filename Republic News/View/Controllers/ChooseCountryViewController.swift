//
//  ViewController.swift
//  Republic News
//
//  Created by sahil pathania on 12/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit

class ChooseCountryViewController: UIViewController {
    
    //MARK:- Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Selected Country button action handler
    @IBAction func countryBtnClicked(_ sender: Any) {
        guard let button = sender as? UIButton else {return}
        guard let title = button.currentTitle else {return}
        var countryCode = ""
        switch title {
        case "India":
            countryCode = CounrtyCode.India.rawValue
        case "Brazil":
            countryCode = CounrtyCode.Brazil.rawValue
        case "Russia":
            countryCode = CounrtyCode.Russia.rawValue
        case "Italy":
            countryCode = CounrtyCode.Italy.rawValue
        case "Mexico":
            countryCode = CounrtyCode.Mexico.rawValue
        case "New Zealand":
            countryCode = CounrtyCode.NewZealand.rawValue
        case "United States":
            countryCode = CounrtyCode.UnitedStates.rawValue
        default:
            countryCode = CounrtyCode.India.rawValue
        }
        navigationToNextScreen(countryCode: countryCode)
    }
    
    /// Present the NewsHomeViewController when some country is selected
    /// - Parameter countryCode: Selected country code
    func navigationToNextScreen(countryCode : String) {
        let newsHomeViewController = NewsHomeViewController.instantiate()
        newsHomeViewController.countryCode = countryCode
        newsHomeViewController.modalPresentationStyle = .overFullScreen
        self.present(newsHomeViewController, animated: true, completion: nil)
    }
}

