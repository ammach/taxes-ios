//
//  Quartier.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class Quartier {

    //MARK:- PROPERTIES
    var  id:CLong?
    let  nom:String
    
    let  secteure:Secteure
    
    var rues:[Rue]?
    
    
    //MARK:- CONSTRUCTORS
    init(nom:String,secteure:Secteure){
    
        self.nom=nom
        self.secteure=secteure
    }
    
    
    
    init(id:CLong,nom:String,secteure:Secteure,rues:[Rue]){
    
        self.id=id
        self.nom=nom
        self.secteure=secteure
        self.rues=rues
    }

}