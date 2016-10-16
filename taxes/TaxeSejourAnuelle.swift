//
//  TaxeSejourAnuelle.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class TaxeSejourAnuelle {
    
    let  id:CLong
    let annee:Int
    let nombreNuit:Double
    let nombreClient:Double
    let montantRetard:Double
    let montantTotalTrimistriel:Double // somme (montant trim)
    let montantTotalRetardTrimistriel:Double // somme (montantRetard trim)
    
    let datePresentation=NSDateFormatter()
    
    let taxeSejourTrimistrielles:[TaxeSejourTrimistrielle]
    
    let  user:User
    
    let dateSystem = NSDateFormatter()
    let colturer:Bool
    
    let  locale:Locale
    let numeroBordure:Int
    let nombreMoisRetard:Int
    
    let  redevable:Redevable
    
    
    init(id:CLong,annee:Int,nombreNuit:Double,nombreClient:Double,montantRetard:Double,montantTotalTrimistriel:Double,montantTotalRetardTrimistriel:Double,taxeSejourTrimistrielles:[TaxeSejourTrimistrielle],user:User,colturer:Bool,locale:Locale,numeroBordure:Int,nombreMoisRetard:Int,redevable:Redevable){
    
        self.id=id
        self.annee=annee
        self.nombreNuit=nombreNuit
        self.nombreClient=nombreClient
        self.montantRetard=montantRetard
        self.montantTotalTrimistriel=montantTotalTrimistriel
        self.montantTotalRetardTrimistriel=montantTotalRetardTrimistriel
        self.taxeSejourTrimistrielles=taxeSejourTrimistrielles
        self.user=user
        self.colturer=colturer
        self.locale=locale
        self.numeroBordure=numeroBordure
        self.nombreMoisRetard=nombreMoisRetard
        self.redevable=redevable
    
    }

}