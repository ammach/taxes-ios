//
//  TaxeBoisonTrimistrielle.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class TaxeBoisonTrimistrielle {
    
    var  id:CLong?
    var numeroTrimistre:Int?
    var chiffreAffaire:CLong?
    var montant:CLong? // pourcentage :::tauxTaxeBoisonApplicable* chiffreAffaire
    var montantRetard:CLong? // TarificationRetardTaxeBoison: premier*chiffreAffaire + deuxiem*chiffreAffaire+autres*chiffreAffaire*(nbrMois -2)
    
    var datePresentation=NSDateFormatter()
    
    var  taxeBoisonAnulle:TaxeBoisonAnuelle?
    
    var  user:User?
    
    var dateSystem = NSDateFormatter()
    var colturer:Bool?
    var montantPremierMoisRetard:Double?
    var pourcentage:Double?
    var pourcentageRetardPremierMois:Double?
    var pourcentageRetardAutreMois:Double?
    var montantAutresMoisRetard:Double?
    var  numeroBordure:CLong?
    var nombreMoisRetard:Int?
    
    var  redevable:Redevable?
    
    
    init(id:CLong,numeroTrimistre:Int,chiffreAffaire:CLong,montant:CLong ,montantRetard:CLong,taxeBoisonAnulle:TaxeBoisonAnuelle,user:User,colturer:Bool,montantPremierMoisRetard:Double,pourcentage:Double,pourcentageRetardPremierMois:Double,pourcentageRetardAutreMois:Double,montantAutresMoisRetard:Double,numeroBordure:CLong,nombreMoisRetard:Int,redevable:Redevable){
    
        self.id=id
        self.numeroTrimistre=numeroTrimistre
        self.chiffreAffaire=chiffreAffaire
        self.montant=montant
        self.montantRetard=montantRetard
        self.taxeBoisonAnulle=taxeBoisonAnulle
        self.user=user
        self.colturer=colturer
        self.montantPremierMoisRetard=montantPremierMoisRetard
        self.montantAutresMoisRetard=montantAutresMoisRetard
        self.pourcentage=pourcentage
        self.pourcentageRetardPremierMois=pourcentageRetardPremierMois
        self.pourcentageRetardAutreMois=pourcentageRetardAutreMois
        self.numeroBordure=numeroBordure
        self.nombreMoisRetard=nombreMoisRetard
        self.redevable=redevable
    }
    
    init(numeroTrimistre:Int,chiffreAffaire:CLong,montant:CLong ,montantRetard:CLong){
    
        self.numeroTrimistre=numeroTrimistre
        self.chiffreAffaire=chiffreAffaire
        self.montant=montant
        self.montantRetard=montantRetard
    }

}