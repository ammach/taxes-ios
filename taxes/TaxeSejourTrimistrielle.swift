//
//  TaxeSejourTrimistrielle.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class TaxeSejourTrimistrielle {
    
    let  id:CLong
    let numeroTrimistre:Int
    let nombreNuit:Double
    let nombreClient:Double
    let montant:Double // pourcentage :::tauxTaxeBoisonApplicable* chiffreAffaire
    let montantRetard:Double // TarificationRetardTaxeBoison: premier*chiffreAffaire + deuxiem*chiffreAffaire+autres*chiffreAffaire*(nbrMois -2)
    
    let datePresentation=NSDateFormatter()
    
    let  taxeSejourAnuelle:TaxeSejourAnuelle
    
    let  user:User
    
    let dateSystem = NSDateFormatter()
    let colturer:Bool
    let montantPremierMoisRetard:Double
    let montantAutresMoisRetard:Double
    let pourcentage:Double
    let pourcentageRetardPremierMois:Double
    let pourcentageRetardAutreMois:Double
    let numeroBordure:CLong
    let nombreMoisRetard:Int
    
    let  redevable:Redevable
    
    init(id:CLong,numeroTrimistre:Int,nombreNuit:Double,nombreClient:Double,montant:Double,montantRetard:Double,taxeSejourAnuelle:TaxeSejourAnuelle,user:User,colturer:Bool,montantPremierMoisRetard:Double,montantAutresMoisRetard:Double,pourcentage:Double,pourcentageRetardPremierMois:Double,pourcentageRetardAutreMois:Double,numeroBordure:CLong,nombreMoisRetard:Int,redevable:Redevable){
    
        self.id=id
        self.numeroTrimistre=numeroTrimistre
        self.nombreNuit=nombreNuit
        self.nombreClient=nombreClient
        self.montant=montant
        self.montantRetard=montantRetard
        self.taxeSejourAnuelle=taxeSejourAnuelle
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

}