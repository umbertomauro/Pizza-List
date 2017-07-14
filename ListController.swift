//
//  ListController.swift
//  Pizza List
//
//  Created by Umberto Mauro on 13/07/17.
//  Copyright © 2017 Umberto Mauro. All rights reserved.
//


//stabiliamo gli elenchi delle celle  (pizze)
import UIKit

class ListController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // stile della barra
        navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        //da black abbiamo messo blackTransLucent
        
        // tinta dei pulsanti nella barra
        navigationController?.navigationBar.tintColor = UIColor.white
        //assegnamo il logo (mai fare il logo piu alto di 30, 7 sopra e 7 sotto)
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        //colore del background
        tableView.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
//Quante sezioni devo avere
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
//Quante righe devo avere in una sezione
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //qui abbiamo detto facci uscire tante pizze quanto ne conti per questo ne escono due 
        return DataManager.shared.storage.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PizzaCell

   //qui diciamo in quale riga deve leggere ( se esce row 0 esce margherita se esce row 1 esce marinara )
                let pizza = DataManager.shared.storage[indexPath.row]
      
       
        //questi sono i valori che deve leggere ovvvero pizza.nome - pizza.ingredienti ecc.)
            cell.labelNome.text = pizza.nome
            cell.labelIngredienti.text = pizza.ingredienti
            cell.viewCalorie.backgroundColor = pizza.coloreCalorie
            cell.imaginePizza.image = pizza.immagine
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
                //quello che salta quando l utente clicca il bottone nella pagina 2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            // se è una table
            if let indexPath = tableView.indexPathForSelectedRow {
                //se ti mezzo ce un navigation lo salta
                let controller = segue.destination as! ViewController
                //let controller = (segue.destination as! UINavigationController).topViewController as! <#NomeController#>
                //passaggio dei dati tra i due controller 
                controller.pizza = DataManager.shared.storage[indexPath.row]
            }
            // se no cancellare tutto l'if
        }
    }

}
