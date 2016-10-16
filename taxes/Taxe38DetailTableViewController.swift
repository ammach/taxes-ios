//
//  Taxe38DetailTableViewController.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import UIKit

class Taxe38DetailTableViewController: UITableViewController {

    
    var taxes38Detail=[Taxe38Trimistrielle]()
    var idTaxe38Anuell:Int!=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.tableView.rowHeight=UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight=70
        
        print("detail: "+"\(idTaxe38Anuell)")
        
        let url=NSURL(string: "http://"+Configuration.ADDR_IP+":28075/taxe3_new/webresources/taxe38anuelle/ByAnuelle")
        let request=NSMutableURLRequest(URL: url!)
        request.HTTPMethod="POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let taxe38=Taxe38Anuelle(id: idTaxe38Anuell)
        do{
            let persoJSON=try NSJSONSerialization.dataWithJSONObject(taxe38.toAnyObject(), options: [])
            request.HTTPBody=persoJSON
        }catch{}
        
        let task=NSURLSession(configuration:NSURLSessionConfiguration.defaultSessionConfiguration()).dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            if let responseData=data{
                do{
                    let jsonResult=try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableContainers) as? NSArray
                    for item in jsonResult! {
                        let numTrim=item["numeroTrimistre"] as! Int
                        let montantTotal=item["montantTotalTrimistrielleItem"] as! Double
                        let montantRetardTotal=item["montantRetardTotalTrimistrielleItem"] as! Double
                        
                        let texe38Trim=Taxe38Trimistrielle(montantTotalTrimistrielleItem: montantTotal, montantRetardTotalTrimistrielleItem: montantRetardTotal, numeroTrimistre: numTrim)
                        
                        self.taxes38Detail.append(texe38Trim)
                        dispatch_async(dispatch_get_main_queue(), {
                            self.tableView.reloadData()
                        })
                    }
                }catch{}
                
            }
        })
        task.resume()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taxes38Detail.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCellWithIdentifier("taxe38detail", forIndexPath: indexPath) as! Taxe38DetailTableViewCell
        
        let taxe38Detail=taxes38Detail[indexPath.row]
        
        cell.numTrimestreLabel.text="\(taxe38Detail.numeroTrimistre)"
        cell.listTaxe38TrimTLabel.text="\(taxe38Detail.montantTotalTrimistrielleItem!)"+" (Montant Total)"
        cell.moisRetardLabel.text="\(taxe38Detail.montantRetardTotalTrimistrielleItem!)"+" (Montant RT)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let cell=tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor=UIColor(red: 172/255, green: 219/255, blue: 134/255, alpha: 1)
        
    }
    
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell=tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor=UIColor(red: 254/255, green: 255/255, blue: 160/255, alpha: 1)
    }
    
}
