//
//  ViewController.swift
//  Pizza List
//
//  Created by Umberto Mauro on 13/07/17.
//  Copyright © 2017 Umberto Mauro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var ImmaginePizza: UIImageView!
    @IBOutlet var LabelCalorie: UILabel!
    @IBOutlet var LabelIngredienti: UILabel!
    
    //qui mettiamo l appoggia dati
    var pizza : PizzaModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // sotto qui si scrive tutto quello che deve essere avviato da subito 
        
        //usiamo una guardia, se passa puo andare altrimenti fermarsi
        guard let pizzaOk = pizza else { return }
            
            self.title = pizzaOk.nome
                //title e la scritta che compare nella 2 pagine come titolo
        
        //lo stabelCalorie.text = pizzaOk.calorie
                LabelCalorie.backgroundColor = pizzaOk.coloreCalorie
        if LabelCalorie.backgroundColor == UIColor.black {
            LabelCalorie.textColor = UIColor.white
    }
            //questo snippet è sw_layrot e serve per arrotondare le palline affianco ai nomi
        LabelCalorie.layer.cornerRadius = 40
        LabelCalorie.layer.borderWidth = 4
        LabelCalorie.layer.borderColor = UIColor.white.cgColor
    
        LabelIngredienti.text = pizzaOk.ingredienti
        
        //questo serve per ruotare l immagine ( immro )
        ImmaginePizza.image = pizzaOk.immagine
        if pizzaOk.immagine.size.width > pizzaOk.immagine.size.height {
            ImmaginePizza.image = UIImage(cgImage: pizzaOk.immagine.cgImage!,
                                            scale: 1.0,
                                            orientation: .right)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func condivi(_ sender: Any) {
        
        //questo serve per fare il controllo se pizzaOk è vuota
        guard let pizzaOK = pizza else { return }
        
       
        let frase = "Oggi ho mangiato una" + pizzaOK.nome
        
        //questo serve a far vedere le varie icone per la condivisione tipo whats app, facebook ( sw_awc)
        let oggetti : [Any] = [frase, pizzaOK.immagine]
        
        let act = UIActivityViewController(activityItems: oggetti, applicationActivities: nil)
        // questo vuole che gli diamo la possibilita di creare un array per poter scrivere "oggi ho mangiato una pizza"
        // application.activities serve per poter aggiungere attivita che non sono di base nel sistema
        
        //questo elenco qui e quello che voglio che non appare
        act.excludedActivityTypes = [UIActivityType.postToFacebook,
                                     UIActivityType.postToTwitter,
                                     UIActivityType.postToWeibo,
                                     UIActivityType.message,
                                     UIActivityType.mail,
                                     UIActivityType.print,
                                     UIActivityType.copyToPasteboard,
                                     UIActivityType.assignToContact,
                                     UIActivityType.saveToCameraRoll,
                                     UIActivityType.addToReadingList,
                                     UIActivityType.postToFlickr,
                                     UIActivityType.postToVimeo,
                                     UIActivityType.postToTencentWeibo,
                                     UIActivityType.airDrop]
        
        
        present(act, animated: true, completion: nil)
    }
    
    
    
}

