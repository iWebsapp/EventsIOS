//
//  CustomSegmentedControl.swift
//  EventsIOS
//
//  Created by Luis Castillo on 22/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class CustomSegmentedControl: UIControl {

    var buttons = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var commaSeparatedButtonTitles: String = "" {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var textColor: UIColor =  UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var selectorColor: UIColor =  UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var selectorTextColor: UIColor =  UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        buttons.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        for title in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height/2
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    @objc func buttonTapped(button: UIButton){
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == button {
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width/CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3, animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
            
        }
        
        sendActions(for: .valueChanged)
    }

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height/2
    }

}
