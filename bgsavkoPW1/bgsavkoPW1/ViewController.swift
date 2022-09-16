//
//  ViewController.swift
//  bgsavkoPW1
//
//  Created by Bogdan Savko on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ChangeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false

        var colorsSet = Set<UIColor>()
        while colorsSet.count < views.count {
            colorsSet.insert(GetRandomUIColor())
        }
        
        view.layer.cornerRadius = 10
        UIView.animate(withDuration: 1, animations: {
            for view in self.views {
                view.layer.cornerRadius = 10
                view.backgroundColor = colorsSet.popFirst()
            }
        }) { completion in
            button?.isEnabled = true
        }
    }
    
    private func GetRandomUIColor() -> UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
    
}

