//
//  TaxeBoissonAnnuellePdf.swift
//  taxes
//
//  Created by adhoc on 26/11/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import UIKit
import PDFGenerator

class TaxeBoissonAnnuellePdf: UIViewController {

    @IBOutlet weak var viewScroll: UIView!
    @IBOutlet weak var viewLeft: UIView!
    @IBOutlet weak var viewRight: UIView!
    
    let viewRow1=UIView()
    let viewRow2=UIView()
    let viewRow3=UIView()
    let viewRow4=UIView()


    @IBOutlet weak var anneeTxt: UILabel!
    @IBOutlet weak var nomRCTxt: UILabel!
    @IBOutlet weak var adresseTxt: UILabel!
    @IBOutlet weak var CinRCTxt: UILabel!
    @IBOutlet weak var telTxt: UILabel!
    @IBOutlet weak var faxTxt: UILabel!
    @IBOutlet weak var exploitantTxt: UILabel!
    @IBOutlet weak var sommeTxt: UILabel!
    @IBOutlet weak var lettreTxt: UILabel!
    @IBOutlet weak var dateTxt: UILabel!
    
    
    @IBOutlet weak var NumTrimLabel: UILabel!
    @IBOutlet weak var chiffreAffaireLabel: UILabel!
    @IBOutlet weak var montantLabel: UILabel!
    @IBOutlet weak var montantRetardLabel: UILabel!

    var dataPdf:NSData?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("load")
        
        viewLeft.layer.borderWidth=1
        viewLeft.layer.borderColor=UIColor.blackColor().CGColor
        
        viewRight.layer.borderWidth=1
        viewRight.layer.borderColor=UIColor.blackColor().CGColor
        
        NumTrimLabel.layer.borderWidth=1
        NumTrimLabel.layer.borderColor=UIColor.blackColor().CGColor
        
        chiffreAffaireLabel.layer.borderWidth=1
        chiffreAffaireLabel.layer.borderColor=UIColor.blackColor().CGColor
        
        montantLabel.layer.borderWidth=1
        montantLabel.layer.borderColor=UIColor.blackColor().CGColor
        
        montantRetardLabel.layer.borderWidth=1
        montantRetardLabel.layer.borderColor=UIColor.blackColor().CGColor
        
        
        
        let url=NSURL(string: "http://"+Configuration.ADDR_IP+":28075/taxe3_new/webresources/taxeboisonanuelle/taxeBoissonPdf")
        let request=NSMutableURLRequest(URL: url!)
        request.HTTPMethod="POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let taxeBoisson=TaxeBoisonAnuelle(id: 3)
        do{
            let taxeJSON=try NSJSONSerialization.dataWithJSONObject(taxeBoisson.toAnyObject(), options: [])
            request.HTTPBody=taxeJSON
        }catch{}
        
        let task=NSURLSession(configuration:NSURLSessionConfiguration.defaultSessionConfiguration()).dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            if let responseData=data{
                do{
                    let jsonResult=try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableContainers)
                   
                    print(jsonResult)
                    
                    let nom=jsonResult["nom"] as! String
                    let adresse=jsonResult["adresse"] as! String
                    let annee=jsonResult["annee"] as! Int
                    let cin=jsonResult["cin"] as! String
                    let date=jsonResult["date"] as! String
                    let exploitant=jsonResult["exploitant"] as! String
                    let fax=jsonResult["fax"] as! String
                    let lettre=jsonResult["lettre"] as! String
                    let secteure=jsonResult["secteure"] as! String
                    let somme=jsonResult["somme"] as! Int
                    let tel=jsonResult["tel"] as! String
                    let taxeBoissonTrimistrielles=jsonResult["taxeBoisonTrimistrielles"] as! NSArray
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.anneeTxt.text="\(annee)"
                        self.nomRCTxt.text = nom
                        self.adresseTxt.text=secteure+","+adresse
                        self.adresseTxt.sizeToFit()
                        self.CinRCTxt.text=cin
                        self.telTxt.text=tel
                        self.faxTxt.text=fax
                        self.exploitantTxt.text=exploitant
                        self.sommeTxt.text="\(somme)"
                        self.lettreTxt.text=lettre
                        
                        let formatter=NSDateFormatter()
                        formatter.dateStyle = .ShortStyle
                        formatter.timeStyle = .MediumStyle
                        if let dateType=formatter.dateFromString(date){
                        self.dateTxt.text=formatter.stringFromDate(dateType)
                        }
                    })
                    
                    
                    
                    self.viewRow1.translatesAutoresizingMaskIntoConstraints=false
                    
                    self.viewRow2.translatesAutoresizingMaskIntoConstraints=false
                 
                    self.viewRow3.translatesAutoresizingMaskIntoConstraints=false
                
                    self.viewRow4.translatesAutoresizingMaskIntoConstraints=false

                    
                    for (i,item) in taxeBoissonTrimistrielles.enumerate() {
                    
                        let numTrim=item["NumeroTrimistre"] as! Int
                        let ca=item["ChiffreAffaire"] as! CLong
                        let montant=item["Montant"] as! CLong
                        let montantRetard=item["MontantRetard"] as! CLong
                        
                        let taxeBoissonTrim=TaxeBoisonTrimistrielle(numeroTrimistre: numTrim, chiffreAffaire: ca, montant: montant, montantRetard: montantRetard)
                        

                        print(taxeBoissonTrim)

                     
                        dispatch_async(dispatch_get_main_queue(), {
                            
                            if i==0 {
                                self.view.addSubview(self.viewRow1)
                                self.viewScroll.addSubview(self.viewRow1)
                                
                                self.viewRow1.leadingAnchor.constraintEqualToAnchor(self.NumTrimLabel.leadingAnchor).active=true
                                self.viewRow1.trailingAnchor.constraintEqualToAnchor(self.montantRetardLabel.trailingAnchor).active=true
                                self.viewRow1.topAnchor.constraintEqualToAnchor(self.montantRetardLabel.bottomAnchor).active=true
                                self.viewRow1.heightAnchor.constraintEqualToConstant(21).active=true
                                
                                let txtNumTrim=UITextView()
                                txtNumTrim.text="\(numTrim)"
                                txtNumTrim.layer.borderWidth=1
                                txtNumTrim.layer.borderColor=UIColor.blackColor().CGColor
                                txtNumTrim.textAlignment = .Center
                                txtNumTrim.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow1.addSubview(txtNumTrim)
                                txtNumTrim.leadingAnchor.constraintEqualToAnchor(self.viewRow1.leadingAnchor).active=true
                                txtNumTrim.widthAnchor.constraintEqualToConstant(59).active=true
                                txtNumTrim.topAnchor.constraintEqualToAnchor(self.viewRow1.topAnchor).active=true
                                txtNumTrim.bottomAnchor.constraintEqualToAnchor(self.viewRow1.bottomAnchor).active=true
                                
                                let txtCA=UITextView()
                                txtCA.text="\(ca)"
                                txtCA.layer.borderWidth=1
                                txtCA.layer.borderColor=UIColor.blackColor().CGColor
                                txtCA.textAlignment = .Center
                                txtCA.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow1.addSubview(txtCA)
                                txtCA.leadingAnchor.constraintEqualToAnchor(txtNumTrim.trailingAnchor).active=true
                                txtCA.widthAnchor.constraintEqualToConstant(89).active=true
                                txtCA.topAnchor.constraintEqualToAnchor(self.viewRow1.topAnchor).active=true
                                txtCA.bottomAnchor.constraintEqualToAnchor(self.viewRow1.bottomAnchor).active=true
                                
                                let txtMontant=UITextView()
                                txtMontant.text="\(montant)"
                                txtMontant.layer.borderWidth=1
                                txtMontant.layer.borderColor=UIColor.blackColor().CGColor
                                txtMontant.textAlignment = .Center
                                txtMontant.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow1.addSubview(txtMontant)
                                txtMontant.leadingAnchor.constraintEqualToAnchor(txtCA.trailingAnchor).active=true
                                txtMontant.widthAnchor.constraintEqualToConstant(59).active=true
                                txtMontant.topAnchor.constraintEqualToAnchor(self.viewRow1.topAnchor).active=true
                                txtMontant.bottomAnchor.constraintEqualToAnchor(self.viewRow1.bottomAnchor).active=true
                                
                                let txtMontantRetard=UITextView()
                                txtMontantRetard.text="\(montantRetard)"
                                txtMontantRetard.layer.borderWidth=1
                                txtMontantRetard.layer.borderColor=UIColor.blackColor().CGColor
                                txtMontantRetard.textAlignment = .Center
                                txtMontantRetard.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow1.addSubview(txtMontantRetard)
                                txtMontantRetard.leadingAnchor.constraintEqualToAnchor(txtMontant.trailingAnchor).active=true
                                txtMontantRetard.widthAnchor.constraintEqualToConstant(97).active=true
                                txtMontantRetard.topAnchor.constraintEqualToAnchor(self.viewRow1.topAnchor).active=true
                                txtMontantRetard.bottomAnchor.constraintEqualToAnchor(self.viewRow1.bottomAnchor).active=true

                            }
                            else if i==1 {
                                self.view.addSubview(self.viewRow2)
                                self.viewScroll.addSubview(self.viewRow2)
                                
                                self.viewRow2.leadingAnchor.constraintEqualToAnchor(self.NumTrimLabel.leadingAnchor).active=true
                                self.viewRow2.trailingAnchor.constraintEqualToAnchor(self.montantRetardLabel.trailingAnchor).active=true
                                self.viewRow2.topAnchor.constraintEqualToAnchor(self.viewRow1.bottomAnchor).active=true
                                self.viewRow2.heightAnchor.constraintEqualToConstant(21).active=true
                                
                                let txtNumTrim=UITextView()
                                txtNumTrim.text="\(numTrim)"
                                txtNumTrim.layer.borderWidth=1
                                txtNumTrim.layer.borderColor=UIColor.blackColor().CGColor
                                txtNumTrim.textAlignment = .Center
                                txtNumTrim.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow2.addSubview(txtNumTrim)
                                txtNumTrim.leadingAnchor.constraintEqualToAnchor(self.viewRow2.leadingAnchor).active=true
                                txtNumTrim.widthAnchor.constraintEqualToConstant(59).active=true
                                txtNumTrim.topAnchor.constraintEqualToAnchor(self.viewRow2.topAnchor).active=true
                                txtNumTrim.bottomAnchor.constraintEqualToAnchor(self.viewRow2.bottomAnchor).active=true
                                
                                let txtCA=UITextView()
                                txtCA.text="\(ca)"
                                txtCA.layer.borderWidth=1
                                txtCA.layer.borderColor=UIColor.blackColor().CGColor
                                txtCA.textAlignment = .Center
                                txtCA.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow2.addSubview(txtCA)
                                txtCA.leadingAnchor.constraintEqualToAnchor(txtNumTrim.trailingAnchor).active=true
                                txtCA.widthAnchor.constraintEqualToConstant(89).active=true
                                txtCA.topAnchor.constraintEqualToAnchor(self.viewRow2.topAnchor).active=true
                                txtCA.bottomAnchor.constraintEqualToAnchor(self.viewRow2.bottomAnchor).active=true
                                
                                let txtMontant=UITextView()
                                txtMontant.text="\(montant)"
                                txtMontant.layer.borderWidth=1
                                txtMontant.layer.borderColor=UIColor.blackColor().CGColor
                                txtMontant.textAlignment = .Center
                                txtMontant.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow2.addSubview(txtMontant)
                                txtMontant.leadingAnchor.constraintEqualToAnchor(txtCA.trailingAnchor).active=true
                                txtMontant.widthAnchor.constraintEqualToConstant(59).active=true
                                txtMontant.topAnchor.constraintEqualToAnchor(self.viewRow2.topAnchor).active=true
                                txtMontant.bottomAnchor.constraintEqualToAnchor(self.viewRow2.bottomAnchor).active=true
                                
                                let txtMontantRetard=UITextView()
                                txtMontantRetard.text="\(montantRetard)"
                                txtMontantRetard.layer.borderWidth=1
                                txtMontantRetard.layer.borderColor=UIColor.blackColor().CGColor
                                txtMontantRetard.textAlignment = .Center
                                txtMontantRetard.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow2.addSubview(txtMontantRetard)
                                txtMontantRetard.leadingAnchor.constraintEqualToAnchor(txtMontant.trailingAnchor).active=true
                                txtMontantRetard.widthAnchor.constraintEqualToConstant(97).active=true
                                txtMontantRetard.topAnchor.constraintEqualToAnchor(self.viewRow2.topAnchor).active=true
                                txtMontantRetard.bottomAnchor.constraintEqualToAnchor(self.viewRow2.bottomAnchor).active=true
                            
                            }
                            else if i==2 {
                                self.view.addSubview(self.viewRow3)
                                self.viewScroll.addSubview(self.viewRow3)
                                
                                self.viewRow3.leadingAnchor.constraintEqualToAnchor(self.NumTrimLabel.leadingAnchor).active=true
                                self.viewRow3.trailingAnchor.constraintEqualToAnchor(self.montantRetardLabel.trailingAnchor).active=true
                                self.viewRow3.topAnchor.constraintEqualToAnchor(self.viewRow2.bottomAnchor).active=true
                                self.viewRow3.heightAnchor.constraintEqualToConstant(21).active=true
                                
                                let txtNumTrim=UITextView()
                                txtNumTrim.text="\(numTrim)"
                                txtNumTrim.layer.borderWidth=1
                                txtNumTrim.layer.borderColor=UIColor.blackColor().CGColor
                                txtNumTrim.textAlignment = .Center
                                txtNumTrim.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow3.addSubview(txtNumTrim)
                                txtNumTrim.leadingAnchor.constraintEqualToAnchor(self.viewRow3.leadingAnchor).active=true
                                txtNumTrim.widthAnchor.constraintEqualToConstant(59).active=true
                                txtNumTrim.topAnchor.constraintEqualToAnchor(self.viewRow3.topAnchor).active=true
                                txtNumTrim.bottomAnchor.constraintEqualToAnchor(self.viewRow3.bottomAnchor).active=true
                                
                                let txtCA=UITextView()
                                txtCA.text="\(ca)"
                                txtCA.layer.borderWidth=1
                                txtCA.layer.borderColor=UIColor.blackColor().CGColor
                                txtCA.textAlignment = .Center
                                txtCA.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow3.addSubview(txtCA)
                                txtCA.leadingAnchor.constraintEqualToAnchor(txtNumTrim.trailingAnchor).active=true
                                txtCA.widthAnchor.constraintEqualToConstant(89).active=true
                                txtCA.topAnchor.constraintEqualToAnchor(self.viewRow3.topAnchor).active=true
                                txtCA.bottomAnchor.constraintEqualToAnchor(self.viewRow3.bottomAnchor).active=true
                                
                                let txtMontant=UITextView()
                                txtMontant.text="\(montant)"
                                txtMontant.layer.borderWidth=1
                                txtMontant.layer.borderColor=UIColor.blackColor().CGColor
                                txtMontant.textAlignment = .Center
                                txtMontant.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow3.addSubview(txtMontant)
                                txtMontant.leadingAnchor.constraintEqualToAnchor(txtCA.trailingAnchor).active=true
                                txtMontant.widthAnchor.constraintEqualToConstant(59).active=true
                                txtMontant.topAnchor.constraintEqualToAnchor(self.viewRow3.topAnchor).active=true
                                txtMontant.bottomAnchor.constraintEqualToAnchor(self.viewRow3.bottomAnchor).active=true
                                
                                let txtMontantRetard=UITextView()
                                txtMontantRetard.text="\(montantRetard)"
                                txtMontantRetard.layer.borderWidth=1
                                txtMontantRetard.layer.borderColor=UIColor.blackColor().CGColor
                                txtMontantRetard.textAlignment = .Center
                                txtMontantRetard.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow3.addSubview(txtMontantRetard)
                                txtMontantRetard.leadingAnchor.constraintEqualToAnchor(txtMontant.trailingAnchor).active=true
                                txtMontantRetard.widthAnchor.constraintEqualToConstant(97).active=true
                                txtMontantRetard.topAnchor.constraintEqualToAnchor(self.viewRow3.topAnchor).active=true
                                txtMontantRetard.bottomAnchor.constraintEqualToAnchor(self.viewRow3.bottomAnchor).active=true
                                
                            }
                            else if i==3 {
                                self.view.addSubview(self.viewRow4)
                                self.viewScroll.addSubview(self.viewRow4)
                                
                                self.viewRow4.leadingAnchor.constraintEqualToAnchor(self.NumTrimLabel.leadingAnchor).active=true
                                self.viewRow4.trailingAnchor.constraintEqualToAnchor(self.montantRetardLabel.trailingAnchor).active=true
                                self.viewRow4.topAnchor.constraintEqualToAnchor(self.viewRow3.bottomAnchor).active=true
                                self.viewRow4.heightAnchor.constraintEqualToConstant(21).active=true
                                
                                let txtNumTrim=UITextView()
                                txtNumTrim.text="\(numTrim)"
                                txtNumTrim.layer.borderWidth=1
                                txtNumTrim.layer.borderColor=UIColor.blackColor().CGColor
                                txtNumTrim.textAlignment = .Center
                                txtNumTrim.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow4.addSubview(txtNumTrim)
                                txtNumTrim.leadingAnchor.constraintEqualToAnchor(self.viewRow4.leadingAnchor).active=true
                                txtNumTrim.widthAnchor.constraintEqualToConstant(59).active=true
                                txtNumTrim.topAnchor.constraintEqualToAnchor(self.viewRow4.topAnchor).active=true
                                txtNumTrim.bottomAnchor.constraintEqualToAnchor(self.viewRow4.bottomAnchor).active=true
                                
                                let txtCA=UITextView()
                                txtCA.text="\(ca)"
                                txtCA.layer.borderWidth=1
                                txtCA.layer.borderColor=UIColor.blackColor().CGColor
                                txtCA.textAlignment = .Center
                                txtCA.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow4.addSubview(txtCA)
                                txtCA.leadingAnchor.constraintEqualToAnchor(txtNumTrim.trailingAnchor).active=true
                                txtCA.widthAnchor.constraintEqualToConstant(89).active=true
                                txtCA.topAnchor.constraintEqualToAnchor(self.viewRow4.topAnchor).active=true
                                txtCA.bottomAnchor.constraintEqualToAnchor(self.viewRow4.bottomAnchor).active=true
                                
                                let txtMontant=UITextView()
                                txtMontant.text="\(montant)"
                                txtMontant.layer.borderWidth=1
                                txtMontant.layer.borderColor=UIColor.blackColor().CGColor
                                txtMontant.textAlignment = .Center
                                txtMontant.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow4.addSubview(txtMontant)
                                txtMontant.leadingAnchor.constraintEqualToAnchor(txtCA.trailingAnchor).active=true
                                txtMontant.widthAnchor.constraintEqualToConstant(59).active=true
                                txtMontant.topAnchor.constraintEqualToAnchor(self.viewRow4.topAnchor).active=true
                                txtMontant.bottomAnchor.constraintEqualToAnchor(self.viewRow4.bottomAnchor).active=true
                                
                                let txtMontantRetard=UITextView()
                                txtMontantRetard.text="\(montantRetard)"
                                txtMontantRetard.layer.borderWidth=1
                                txtMontantRetard.layer.borderColor=UIColor.blackColor().CGColor
                                txtMontantRetard.textAlignment = .Center
                                txtMontantRetard.translatesAutoresizingMaskIntoConstraints=false
                                
                                self.viewRow4.addSubview(txtMontantRetard)
                                txtMontantRetard.leadingAnchor.constraintEqualToAnchor(txtMontant.trailingAnchor).active=true
                                txtMontantRetard.widthAnchor.constraintEqualToConstant(97).active=true
                                txtMontantRetard.topAnchor.constraintEqualToAnchor(self.viewRow4.topAnchor).active=true
                                txtMontantRetard.bottomAnchor.constraintEqualToAnchor(self.viewRow4.bottomAnchor).active=true
                            }
                            
                        })
                        
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        let dst = NSHomeDirectory().stringByAppendingString("/sample1.pdf")
                        // outputs as NSData
                        do {
                            self.dataPdf = try PDFGenerator.generate(self.viewScroll)
                            self.dataPdf!.writeToFile(dst, atomically: true)
                        } catch (let error) {
                            print(error)
                        }
                        
                        // writes to Disk directly.
                        do {
                            try PDFGenerator.generate(self.viewScroll, outputPath: dst)
                        } catch (let error) {
                            print(error)
                        }
                        
                        let storyBoard=UIStoryboard(name: "Main", bundle: nil)
                        let destVC=storyBoard.instantiateViewControllerWithIdentifier("pdfVC") as! TaxeBoissonAnnuellePdfViewer
                        destVC.data=self.dataPdf
                        
                        self.presentViewController(destVC, animated: true, completion: nil)
                    })
                    
                }catch{}
                
            }

        })
        task.resume()

       
        
            }
    

    

    

    
}
