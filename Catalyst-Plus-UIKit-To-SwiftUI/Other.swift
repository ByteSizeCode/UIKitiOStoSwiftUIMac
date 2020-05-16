//
//  Other.swift
//
//  Created by hayashi311 on 05/08/2020.
//  Copyright (c) 2020 hayashi311. All rights reserved.
//

import Foundation
import UIKit
//import Colorful

class MyViewController: UIViewController {

    let colorPicker: ColorPicker! = ColorPicker()
    let label: UILabel! = UILabel()
    let colorSpaceLabel:UILabel! = UILabel()
    var colorSpace: HRColorSpace = .sRGB

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(ColorPicker.init(frame: CGRect(x: 200, y: 200, width: 400, height: 800)))
        
        colorPicker.addTarget(self, action: #selector(self.handleColorChanged(picker:)), for: .valueChanged)
        colorPicker.set(color: UIColor(displayP3Red: 1.0, green: 1.0, blue: 0, alpha: 1), colorSpace: colorSpace)
        updateColorSpaceText()
        handleColorChanged(picker: colorPicker)
    }

    @objc func handleColorChanged(picker: ColorPicker) {
        label.text = picker.color.description
    }

    @IBAction func handleRedButtonAction(_ sender: UIButton) {
        colorPicker.set(color: .red, colorSpace: colorSpace)
        handleColorChanged(picker: colorPicker)
    }

    @IBAction func handlePurpleButtonAction(_ sender: UIButton) {
        colorPicker.set(color: .purple, colorSpace: colorSpace)
        handleColorChanged(picker: colorPicker)
    }

    @IBAction func handleYellowButtonAction(_ sender: UIButton) {
        colorPicker.set(color: .yellow, colorSpace: colorSpace)
        handleColorChanged(picker: colorPicker)
    }

    @IBAction func handleSwitchAction(_ sender: UISwitch) {
        colorSpace = sender.isOn ? .extendedSRGB : .sRGB
        colorPicker.set(color: colorPicker.color, colorSpace: colorSpace)
        updateColorSpaceText()
        handleColorChanged(picker: colorPicker)
    }

    func updateColorSpaceText() {
        switch colorSpace {
        case .extendedSRGB:
            colorSpaceLabel.text = "Extended sRGB"
        case .sRGB:
            colorSpaceLabel.text = "sRGB"
        }
    }
}

