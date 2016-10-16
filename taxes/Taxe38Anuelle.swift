//
//  Taxe38Anuelle.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation



class Taxe38Anuelle {
    
    
    //MARK:- PROPERTIES
    var  id:Int?
    var annee:Int?
    //private BigDecimal montantRetard;
    var montantTotalTrimistriel:Double?// somme (montant trim)
    var montantTotalRetardTrimistriel:Double? // somme (montantRetard trim)
    
    var datePresentation=NSDateFormatter()
    
    var taxe38Trimistrielles:[Taxe38Trimistrielle]?
    
    var  user:User?
    
    var dateSystem = NSDateFormatter()
    var colturer:Bool?
    
    var  locale:Locale?
    var  numeroBordure:CLong?
    var nombreTotaleMoisRetard:Int?
    
    var  redevable:Redevable?
    var valeurLocation:Double?
    var surface:Double?
    
    
    //MARK:- CONSTRUCTORS
    init(id:Int,annee:Int,locale:Locale,redevable:Redevable,valeurLocation:Double){
    
        self.id=id
        self.annee=annee
        self.locale=locale
        self.redevable=redevable
        self.valeurLocation=valeurLocation
    }
    
    
    init(id:Int){
    self.id=id
    }
    
    
    init(id:Int,annee:Int,montantTotalTrimistriel:Double ,montantTotalRetardTrimistriel:Double,taxe38Trimistrielles:[Taxe38Trimistrielle],user:User,colturer:Bool,locale:Locale, numeroBordure:CLong,nombreTotaleMoisRetard:Int,redevable:Redevable,valeurLocation:Double,surface:Double){
    
        self.id=id
        self.annee=annee
        self.montantTotalTrimistriel=montantTotalTrimistriel
        self.montantTotalRetardTrimistriel=montantTotalRetardTrimistriel
        self.taxe38Trimistrielles=taxe38Trimistrielles
        self.user=user
        self.colturer=colturer
        self.locale=locale
        self.numeroBordure=numeroBordure
        self.nombreTotaleMoisRetard=nombreTotaleMoisRetard
        self.redevable=redevable
        self.valeurLocation=valeurLocation
        self.surface=surface
    }

    //MARK:- FUNCTIONS
    
    func toAnyObject()->NSDictionary{
        return ["id":self.id!] 
    }
}