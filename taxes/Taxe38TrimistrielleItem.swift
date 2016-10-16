//
//  Taxe38TrimistrielleItem.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class Taxe38TrimistrielleItem {
    
    let  id:CLong
    let montant:Double
    let montantPremierMoisRetard:Double
    let montantAutreMoisRetard:Double
    let montantRetard:Double
    let pourcentage:Double
    let pourcentageRetardPremierMois:Double
    let pourcentageRetardAutreMois:Double
    let surfaceMin:Double
    let montantMin:Double
    let nombreElementLocale38Item:Int// ch7al mn element kan f lwa9t li tkheless had taxe
    
    let datePresentation=NSDateFormatter()
    let nombreMoisRetard:Int
    
    let  taxe38Trimistrielle:Taxe38Trimistrielle
    
    let  locale38Item:Locale38Item
    
    let  redevable:Redevable
    
    let  user:User
    
    let dateSystem = NSDateFormatter()
    
    init( id:CLong,montant:Double,montantPremierMoisRetard:Double,montantAutreMoisRetard:Double,montantRetard:Double,pourcentage:Double,pourcentageRetardPremierMois:Double,pourcentageRetardAutreMois:Double,surfaceMin:Double,montantMin:Double,nombreElementLocale38Item:Int,nombreMoisRetard:Int,taxe38Trimistrielle:Taxe38Trimistrielle,locale38Item:Locale38Item,redevable:Redevable,user:User){
        
        self.id=id
        self.montant=montant
        self.montantPremierMoisRetard=montantPremierMoisRetard
        self.montantAutreMoisRetard=montantAutreMoisRetard
        self.montantRetard=montantRetard
        self.pourcentage=pourcentage
        self.pourcentageRetardPremierMois=pourcentageRetardPremierMois
        self.pourcentageRetardAutreMois=pourcentageRetardAutreMois
        self.surfaceMin=surfaceMin
        self.montantMin=montantMin
        self.nombreElementLocale38Item=nombreElementLocale38Item
        self.nombreMoisRetard=nombreMoisRetard
        self.taxe38Trimistrielle=taxe38Trimistrielle
        self.locale38Item=locale38Item
        self.redevable=redevable
        self.user=user
    
    }

}