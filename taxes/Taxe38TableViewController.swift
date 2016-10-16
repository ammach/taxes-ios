//
//  Taxe38TableViewController.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import UIKit

class Taxe38TableViewController: UITableViewController {
    
    
    var taxes38=[Taxe38Anuelle]()
    var taxe38:Taxe38Anuelle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            self.tableView.rowHeight=UITableViewAutomaticDimension
            self.tableView.estimatedRowHeight=70
        
        
       
        
        
        let url=NSURL(string: "http://"+Configuration.ADDR_IP+":28075/taxe3_new/webresources/taxe38anuelle/list")
        let task=NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) in
            
            if let content=data {
                do{
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(content, options: NSJSONReadingOptions.MutableContainers) as? NSArray
              
                    for item in jsonResult! {
                    let redevableJson = item["redevable"] as! NSDictionary
                    let localeJson = item["locale"] as! NSDictionary
                    let rueJson = localeJson["rue"] as! NSDictionary
                    let quartierJson = rueJson["quartier"] as! NSDictionary
                    let secteureJson = quartierJson["secteure"] as! NSDictionary
                    let communeJson = secteureJson["commune"] as! NSDictionary
                    let villeJson = communeJson["ville"] as! NSDictionary
                        if let nomVille=villeJson["nom"]{
                            
                            let commune=Commune(ville: Ville(nom:nomVille as! String))
                            if let nomSecteure=secteureJson["nom"] {
                            
                                let secteure=Secteure(nom: nomSecteure as! String, commune: commune)
                                
                                if let nomQuartier=quartierJson["nom"] {
                                
                                    let quartier=Quartier(nom: nomQuartier as! String, secteure: secteure)
                                    
                                    if let nomRue=rueJson["nom"] {
                                    
                                        let rue=Rue(nom: nomRue as! String, quartier: quartier)
                                        
                                        if let adresseRue=localeJson["adresse"] {
                                        
                                            let locale=Locale(adresse: adresseRue as! String, rue: rue)
                                            if let cinRedevable=redevableJson["cin"] {
                                            
                                                let redevable=Redevable(cin: cinRedevable as! String)
                                                
                                                if let idTaxe38Anuelle=item["id"],let anneeTaxe38Anuelle=item["annee"],let valeurLocationTaxe38Anuelle=item["valeurLocation"] {
                                                    let id=idTaxe38Anuelle as! Int
                                                    let annee=anneeTaxe38Anuelle as! Int
                                                    let valeurLocation=valeurLocationTaxe38Anuelle as! Double
                                                    print("\(id)")
                                                    print("\(annee)")
                                                    print("\(valeurLocation)")
                                                    let taxe38 = Taxe38Anuelle(id: id, annee: annee, locale: locale, redevable: redevable, valeurLocation: valeurLocation)
                                                    
                                                    self.taxes38.append(taxe38)
                                                    

                                                    dispatch_async(dispatch_get_main_queue(), {
                                                         self.tableView.reloadData()
                                                    })
                                                   
                                                }
                                                
                                                
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                       
                    }
                    
                    
                }catch{}
                
                
            }
        })
        task.resume()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taxes38.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell=tableView.dequeueReusableCellWithIdentifier("taxe38", forIndexPath: indexPath) as! Taxe38TableViewCell
        let taxe38=taxes38[indexPath.row]
        
        cell.redevableLabel.text=taxe38.redevable?.cin
        cell.anneeLabel.text="\(taxe38.annee!)"
        cell.valeurActionLabel.text="\(taxe38.valeurLocation!)"+" (VL)"
        cell.localeLabel.text=(taxe38.locale?.rue?.quartier.secteure.nom)!+","+(taxe38.locale?.rue?.quartier.nom)!+","+(taxe38.locale?.rue?.nom)!+","+(taxe38.locale?.adresse)!
        
        return cell
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
         self.taxe38=taxes38[indexPath.row]
        print("didselect: "+"\(taxe38?.id!)")
        
        let cell=tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor=UIColor(red: 172/255, green: 219/255, blue: 134/255, alpha: 1)
        
    }
    
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell=tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor=UIColor(red: 254/255, green: 255/255, blue: 160/255, alpha: 1)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dest=segue.destinationViewController as! Taxe38DetailTableViewController
        let index=tableView.indexPathForSelectedRow?.row
        let taxe:Taxe38Anuelle=self.taxes38[index!]
        print("prepare: "+"\(taxe.id!)")
        dest.idTaxe38Anuell=taxe.id
    }
    
}
