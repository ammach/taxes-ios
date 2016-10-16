//
//  Secteure.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation



class Secteure {
    
    
    // MARK:- PROPERTIES
    var  id:CLong?
    let  nom:String
    
    let  commune:Commune
    
    var quartiers:[Quartier]?
    
    
    //MARK:- Constructors
    init(nom:String,commune:Commune){
    
        self.nom=nom
        self.commune=commune
    }
    
    
    init( id:CLong,nom:String,commune:Commune,quartiers:[Quartier]){
    
        self.id=id
        self.nom=nom
        self.commune=commune
        self.quartiers=quartiers
    }

}