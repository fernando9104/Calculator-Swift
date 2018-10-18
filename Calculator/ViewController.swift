//
//  ViewController.swift
//  Calculator
//
//  Created by Developer02 on 17/10/18.
//  Copyright © 2018 Developer02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variable para la primera etiqueta
    @IBOutlet weak var numLabel1: UILabel!
    @IBOutlet weak var numLabel2: UILabel!
    @IBOutlet weak var opeLabel3: UILabel!
    var operation:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Funcion que detecta los eventos de las teclas numericas de la calculadora
    @IBAction func numberKeys(_ sender: UIButton) {
        numLabel2.text = numLabel2.text! + String(sender.tag)
    }
    
    // Funcion que detecta los eventos de las dems teclas de la calculadora
    @IBAction func otherKeys(_ sender: UIButton ) {
        
        // Identifica el tipo de operador
        switch sender.tag {
            case 15: //tecla AC
                numLabel2.text = ""
                numLabel1.text = ""
                opeLabel3.text = ""
                break
            case 16: //tecla R
                if( numLabel2.text != "" ){
                    var numb2:String = numLabel2.text!
                    numLabel2.text = String(numb2.dropLast(1))
                }else
                if( opeLabel3.text != "" ){
                    opeLabel3.text = ""
                    numLabel2.text = numLabel1.text
                    numLabel1.text = ""
                }
                break
            case 17: //tecla =
                if( numLabel1.text != "" && numLabel2.text != "" ){
                    
                    var numb1:Double  = Double(numLabel2.text!)!
                    var numb2:Double  = Double(numLabel1.text!)!
                    var result:Double = doCalc( numb1:numb2, numb2:numb1, op:operation )
                    numLabel1.text    = ""
                    opeLabel3.text    = ""
                    
                    if ( result.isInfinite ){
                        numLabel2.text = "Not number"
                    }else{
                        numLabel2.text = String(result)
                    }
                }
                break
            default:
                break;
        }// Fin del switch
    }
    
    // Funcion que detecta los eventos de las teclas operadoras de la calculadora
    @IBAction func operatorKeys(_ sender: UIButton) {
        
        if( numLabel1.text != "" || numLabel2.text != "" ){
        
            // Identifica el tipo de operador
            switch sender.tag {
                case 10: // tecla +
                    operation = "+"
                    break
                case 11: // tecla -
                    operation = "-"
                    break
                case 12: // tecla x
                    operation = "x"
                    break
                case 13: // tecla /
                    operation = "/"
                    break
                case 14: // tecla %
                    numLabel2.text = String( Double(numLabel2.text!)! / 100 )
                    break
                default:
                    break;
            }// Fin del switch
            
            // mientras no sea la tecla %
            if ( sender.tag != 14 ){
                
                opeLabel3.text = operation
                
                if( numLabel1.text == "" ){
                    numLabel1.text = numLabel2.text;
                    numLabel2.text = ""
                }else
                if ( numLabel1.text != "" && numLabel2.text != "" ){
                    var numb1:Double  = Double(numLabel2.text!)!
                    var numb2:Double  = Double(numLabel1.text!)!
                    var result:Double = doCalc( numb1:numb2, numb2:numb1, op:operation )
                    numLabel1.text = String(result)
                    opeLabel3.text = operation
                    numLabel2.text = ""
                }
            }
        }
        
    }// fin funcion
    
    // Funcion que calcula el resultado de dos valores segun su operacion
    private func doCalc( numb1:Double, numb2:Double, op:String ) -> Double{
        
        var result:Double = 0
        
        // Identifica el tipo de operador
        switch op {
            case "+":
                result = numb1 + numb2;
                break
            case "-":
                result = numb1 - numb2;
                break
            case "x":
                result = numb1 * numb2;
                break
            case "/":
                result = numb1 / numb2;
                break
            default:
                break;
        }// Fin del switch
        
        return result
    }
    
}

