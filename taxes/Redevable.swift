//
//  Redevable.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class Redevable {
    
    
    //MARK:- PROPERTIES
    var  login:String?
    var  password:String?
    var  cin:String?
    var  telephone:String?
    var  patente:String?
    var  nomCommerciale:String?
    
    var  activite:Activite?
    var  fax:String?
    var  nom:String?
    var  prenom:String?
    var  email:String?
    var comptable:Bool?
    var entite:Int? //0==>Personne Physique;1==>Societe Physique;2==>Societe Morale
    var  rc:String?
    var  raisonSocial:String?
    var  adresse:String?
    var chaumage:Bool?
    
    var type:Int?
    var nbrCommercial:Int?
    var nbrProfessionelle:Int?
    var nbrIndustrielle:Int?
    var nbrCiosqueTel:Int?
    var nbrCiosqueCommercial:Int?
    var nbrPepinaire:Int?
    var nbrPanneauPub:Int?
    var nbrPanneauPubAvec:Int?
    var nbrPanneauMural:Int?
    var nbrPoteau:Int?
    var nbrToteme:Int?
    var nbrTroutoire:Int?
    
    var dateChaumage = NSDateFormatter()
    var natureExploitant:Int?// 0: gerant 1:proprietaire 2:directeur
    
    var dateDemarrageActivite=NSDateFormatter()
    
    var  user:User?
    
    var dateSystem = NSDateFormatter()
    
    var taxeSejourAnuelles:[TaxeSejourAnuelle]?
    
    var taxeBoisonAnuelles:[TaxeBoisonAnuelle]?
    
    var locales:[Locale]?
    
    
    
    //MARK:- CONSTRUCTORS
    init(cin:String){
    
        self.cin=cin
    }
    
    
    
    init(type:Int,nbrCommercial:Int,nbrProfessionelle:Int,nbrIndustrielle:Int,nbrCiosqueTel:Int,nbrCiosqueCommercial:Int,nbrPepinaire:Int,nbrPanneauPub:Int,nbrPanneauPubAvec:Int,nbrPanneauMural:Int,nbrPoteau:Int,nbrToteme:Int,nbrTroutoire:Int,natureExploitant:Int,user:User,taxeSejourAnuelles:[TaxeSejourAnuelle],taxeBoisonAnuelles:[TaxeBoisonAnuelle],locales:[Locale],login:String,password:String,cin:String,telephone:String,patente:String,nomCommerciale:String,activite:Activite,fax:String,nom:String,prenom:String,email:String,comptable:Bool,entite:Int,rc:String,raisonSocial:String,adresse:String,chaumage:Bool){
        
        self.type=type
        self.nbrCommercial=nbrCommercial
        self.nbrProfessionelle=nbrProfessionelle
        self.nbrIndustrielle=nbrIndustrielle
        self.nbrCiosqueTel=nbrCiosqueTel
        self.nbrCiosqueCommercial=nbrCiosqueCommercial
        self.nbrPepinaire=nbrPepinaire
        self.nbrPanneauPub=nbrPanneauPub
        self.nbrPanneauPubAvec=nbrPanneauPubAvec
        self.nbrPanneauMural=nbrPanneauMural
        self.nbrPoteau=nbrPoteau
        self.nbrToteme=nbrToteme
        self.nbrTroutoire=nbrTroutoire
        self.natureExploitant=natureExploitant
        self.user=user
        self.taxeSejourAnuelles=taxeSejourAnuelles
        self.taxeBoisonAnuelles=taxeBoisonAnuelles
        self.locales=locales
        self.login=login
        self.password=password
        self.cin=cin
        self.telephone=telephone
        self.patente=patente
        self.nomCommerciale=nomCommerciale
        self.activite=activite
        self.fax=fax
        self.nom=nom
        self.prenom=prenom
        self.email=email
        self.comptable=comptable
        self.entite=entite
        self.rc=rc
        self.raisonSocial=raisonSocial
        self.adresse=adresse
        self.chaumage=chaumage
    }
    

    
   

}