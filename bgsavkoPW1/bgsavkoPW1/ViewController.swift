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
        var colorsSet = CreateColorsSet()
        SetViewsBgColor(colors: &colorsSet, corenerRaduis: 16)
    }

    @IBAction func ChangeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false

        var colorsSet = CreateColorsSet()
        
        UIView.animate(withDuration: 1, animations: {
            self.SetViewsBgColor(colors: &colorsSet, corenerRaduis: 16)
        }) { completion in
            button?.isEnabled = true
        }
    }
    
    private func CreateColorsSet() -> Set<UIColor> {
        var colorsSet = Set<UIColor>()
        while colorsSet.count < views.count {
            colorsSet.insert(GetRandomUIColor())
        }
        return colorsSet
    }
    
    private func SetViewsBgColor(colors: inout Set<UIColor>, corenerRaduis: CGFloat) {
        for view in self.views {
            view.layer.cornerRadius = corenerRaduis
            view.backgroundColor = colors.popFirst()
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

