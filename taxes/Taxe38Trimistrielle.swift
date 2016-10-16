//
//  Taxe38Trimistrielle.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class Taxe38Trimistrielle {
    
    var  id:CLong?
    var montantTotalTrimistrielleItem:Double?
    
    var montantRetardTotalTrimistrielleItem:Double?
    var numeroTrimistre:Int
    
    var  taxe38Anuelle:Taxe38Anuelle?
    
    var  redevable:Redevable?
    var colturer:Bool?
    var  numeroBordure:CLong?
    
    var taxe38TrimistrielleItems:[Taxe38TrimistrielleItem]?
    
    var  user:User?
    
    var dateSystem = NSDateFormatter()
    
    init(montantTotalTrimistrielleItem:Double,montantRetardTotalTrimistrielleItem:Double,numeroTrimistre:Int){
        self.montantTotalTrimistrielleItem=montantTotalTrimistrielleItem
        self.montantRetardTotalTrimistrielleItem=montantRetardTotalTrimistrielleItem
        self.numeroTrimistre=numeroTrimistre
    }
    
    init(id:CLong,montantTotalTrimistrielleItem:Double,montantRetardTotalTrimistrielleItem:Double,numeroTrimistre:Int,taxe38Anuelle:Taxe38Anuelle,redevable:Redevable,colturer:Bool,numeroBordure:CLong,taxe38TrimistrielleItems:[Taxe38TrimistrielleItem],user:User){
    
        self.id=id
        self.montantTotalTrimistrielleItem=montantTotalTrimistrielleItem
        self.montantRetardTotalTrimistrielleItem=montantRetardTotalTrimistrielleItem
        self.numeroTrimistre=numeroTrimistre
        self.taxe38Anuelle=taxe38Anuelle
        self.redevable=redevable
        self.colturer=colturer
        self.numeroBordure=numeroBordure
        self.taxe38TrimistrielleItems=taxe38TrimistrielleItems
        self.user=user
    }

}