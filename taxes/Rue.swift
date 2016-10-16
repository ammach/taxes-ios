//
//  Rue.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class Rue {
    
    //MARK:- PROPERTIES
    var  id:CLong?
    let  nom:String
    var type:Bool?//0:rue 1:avenue
    
    let  quartier:Quartier
    
    var locales:[Locale]?
    
    
    //MARK:- CONSTRUCTORS
    init(nom:String,quartier:Quartier){
    
        self.nom=nom
        self.quartier=quartier
    }
    
    init(id:CLong,nom:String,nomc:String,type:Bool,quartier:Quartier,locales:[Locale]){
    
        self.id=id
        self.nom=nomc
        self.type=type
        self.quartier=quartier
        self.locales=locales
    }

}