//
//  ViewController.swift
//  Сalculator
//
//  Created by Ася Купинская on 04.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var numberFromScreen: Double = 0 //текущее число на экране
    private var previousNumberFromScreen: Double = 0//предыдущее число на экране
    private var operation = false//выбрана операция
    private var operationType = 0//выбранная операция
    private let colorButton = UIColor(red: 0.64, green: 0.87, blue: 0.68, alpha: 1.00) //цвет кнопок операций
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func pressedButton(_ sender: UIButton) {
        //убираем признак нажатой предыдущей кнопки
        if operationType != 0{
            changeColor(operationType, colorButton)
        }
        if sender.tag > 0 && sender.tag < 11{ //нажали на число
            if operation {
                label.text = String(sender.tag)
                numberFromScreen = Double(label.text!)!
                operation = false
            } else{
                label.text = label.text! + String(sender.tag)
                numberFromScreen = Double(label.text!)!
            }
        }  //кнопка с операцией
        switch sender.tag{
        case 11:
            label.text = label.text! + "."
            numberFromScreen = Double(label.text!)!
        case 12: calculate()
        case 13: clickOperation(tag: 13)
        case 14: clickOperation(tag: 14)
        case 15: clickOperation(tag: 15)
        case 16: clickOperation(tag: 16)
        case 17:
            numberFromScreen = numberFromScreen / 100
            label.text = String(numberFromScreen)
            changeColor(17, .white)
            operation = true
            operationType = 17
            previousNumberFromScreen = 0
            
        case 18:
            label.text = ""
            numberFromScreen = 0
            previousNumberFromScreen = 0
            operation = false
            operationType = 18
        default: return
        }
        
        
    }
    
    private func changeColor(_ tag: Int, _ color: UIColor){
        let tmpButton = self.view.viewWithTag(tag) as? UIButton
        tmpButton?.backgroundColor = color
    }
    
    private func clickOperation(tag: Int){
        previousNumberFromScreen = numberFromScreen
        operation = true
        operationType = tag
        changeColor(operationType, .white)
        
    }
    
    private func calculate(){
        switch operationType{
        case 13:
            numberFromScreen = numberFromScreen + previousNumberFromScreen
        case 14:
            numberFromScreen = previousNumberFromScreen - numberFromScreen
        case 15:
            if numberFromScreen != 0 {
               numberFromScreen = previousNumberFromScreen / numberFromScreen
            }
        case 16:
            numberFromScreen = numberFromScreen * previousNumberFromScreen
        default: return
        }
        label.text = String(numberFromScreen)
        changeColor(12, .white)
        operation = true
        operationType = 12
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    


}

