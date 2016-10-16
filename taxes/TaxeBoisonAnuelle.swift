//
//  TaxeBoisonAnuelle.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class TaxeBoisonAnuelle {
    
    var  id:CLong?
    var annee:Int?
    var montantRetard:Double?
    var montantTotalTrimistriel:Double? // somme (montant trim)
    var montantTotalRetardTrimistriel:Double? // somme (montantRetard trim)
    var chiffreAffaire:Double? // somme chiffre affaire trim
    
    var datePresentation=NSDateFormatter()
    
    var taxeBoisonTrimistrielles:[TaxeBoisonTrimistrielle]?
    
    var  locale:Locale?
    
    var  user:User?
    
    var dateSystem = NSDateFormatter()
    var colturer:Bool?
    
    var  redevable:Redevable?
    var numeroBordure:Int?
    var nombreMoisRetard:Int?
    
    
    init(id:CLong,annee:Int,montantRetard:Double,montantTotalTrimistriel:Double,montantTotalRetardTrimistriel:Double ,chiffreAffaire:Double,taxeBoisonTrimistrielles:[TaxeBoisonTrimistrielle],locale:Locale,user:User,colturer:Bool,redevable:Redevable,numeroBordure:Int,nombreMoisRetard:Int){
    
        self.id=id
        self.annee=annee
        self.montantRetard=montantRetard
        self.montantTotalTrimistriel=montantTotalTrimistriel
        self.montantTotalRetardTrimistriel=montantTotalRetardTrimistriel
        self.chiffreAffaire=chiffreAffaire
        self.taxeBoisonTrimistrielles=taxeBoisonTrimistrielles
        self.locale=locale
        self.user=user
        self.colturer=colturer
        self.redevable=redevable
        self.numeroBordure=numeroBordure
        self.nombreMoisRetard=nombreMoisRetard
    }


    
    
    init(id:CLong){
        self.id=id
    }
    
    func toAnyObject()->NSDictionary{
        return ["id":self.id!]
    }
}