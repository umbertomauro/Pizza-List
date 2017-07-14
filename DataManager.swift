//
//  DataManager.swift
//  Pizza List
//
//  Created by Umberto Mauro on 13/07/17.
//  Copyright © 2017 Umberto Mauro. All rights reserved.
//

//Data manager serve per salvare il tutto

import Foundation

class DataManager {
	
	static let shared = DataManager()  //variabile statica che la indirizzo e non cambia piu 
	
	var storage : [PizzaModel] = []            
	//per prendere la data managere bisogna scrivere questi 3 passaggi ovvero = DataManager.shared.storage
    
    var filePath : String!
    // conserva l indirizzo per prendere il Path.
    
        func caricaDati() {
		filePath = cartellaDocuments() + "/pizze.plist"
                //dichiaro il percorso del file quando sara creato e si chiamera pizze.plist
            
            if FileManager.default.fileExists(atPath: filePath) == true {
                storage = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! [PizzaModel]
                //questo dice se e vero che esiste il file salvato
                //prende il file pizza list lo dearchivia dal array ma non sa cosa de archiviarla perche l' abbiamo disarchiavata ma ora lo sa perche gli ho associato un array di PizzaModel
            } else {
                
                let margh = PizzaModel(nome: "Margherita",
                                       ingredienti: "Pomodoro, Mozzarella",
                                       calorie: "840",
                                       immagine: #imageLiteral(resourceName: "margherita"))
                let marin = PizzaModel(nome: "Marinara",
                                       ingredienti: "Pomodoro, Aglio",
                                       calorie: "720",
                                       immagine: #imageLiteral(resourceName: "marinara"))
                storage = [margh, marin]
                //qui abbiamo salvato due tipi di pizze che poi verrano contate quando scriveremo ( return DataManager.shared.storage.count ) in List Controller
                salva()
            
            }
            dump(storage)  // lo fai 2 volte : 1. per vedere la creazione dei dati è andata 2. se è avviato correttamente la lista ecc.
            // mentre il debubPrint mi fa vedere l indirizzo di memoria 
    }
    
	func salva() {
        NSKeyedArchiver.archiveRootObject(storage, toFile: filePath)
	}
	
	func cartellaDocuments() -> String {
		let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		//print(paths[0]) // serve per fare il test per vedere se ce la cartella nei documenti salvata
        print(paths[0])
		return paths[0]
	}
}
