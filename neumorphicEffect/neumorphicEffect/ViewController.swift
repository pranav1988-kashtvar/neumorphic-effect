//
//  ViewController.swift
//  neumorphicEffect
//
//  Created by Shi Pra on 03/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var button: NeumorphicButton = {
        let btn = NeumorphicButton()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Click Me", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
    }

    override func viewWillLayoutSubviews() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        super.viewWillLayoutSubviews()
    }
    
    @objc func btnPressed() {
        print("Button Pressed")
    }
    
}

