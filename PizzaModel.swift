//
//  PizzaModel.swift
//  Pizza List
//
//  Created by Umberto Mauro on 13/07/17.
//  Copyright © 2017 Umberto Mauro. All rights reserved.
//

//creiamo il modello dell' app

import UIKit

class PizzaModel: NSObject, NSCoding  {        // <- Protocoll
    
    var nome : String
    var ingredienti : String
    var calorie : String
    var immagine : UIImage
    
    var coloreCalorie : UIColor {
            //questo è il get
        if let calTest = Int(calorie) {
            //switch fabbrica di colori 
            switch calTest {
            case ...400: return UIColor(named:"bianco")!
            case 401...800: return UIColor(named:"giallo")!
            case 801...1200: return UIColor(named:"rosso")!
            case 1201...1600: return UIColor(named:"rosso")!
            case 1601...2000: return UIColor(named:"viola")!        //da 1601 a 2000 calorie esce viola
            default : return UIColor.black                          //se supera 2000 calorie esce nero
            }
            
        }
            return UIColor.blue         //se non rientra neanche nell If allora esce blue
    }
    
    
    init(nome: String, ingredienti: String, calorie: String, immagine: UIImage) {
        self.nome = nome
        self.ingredienti = ingredienti
        self.calorie = calorie
        self.immagine = immagine
    }
    
    
    internal required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as! String
        self.ingredienti = aDecoder.decodeObject(forKey: "ingredienti") as! String
        self.calorie = aDecoder.decodeObject(forKey: "calorie") as! String
        self.immagine = UIImage(data: aDecoder.decodeObject(forKey: "immagine") as! Data)!
    }
    
    func encode(with encoder: NSCoder) {
        encoder.encode(self.nome, forKey: "nome")
        encoder.encode(self.ingredienti, forKey: "ingredienti")
        encoder.encode(self.calorie, forKey: "calorie")
        encoder.encode(UIImageJPEGRepresentation(self.immagine, 0.5), forKey: "immagine")
    }
    
    
    
    
    
}
