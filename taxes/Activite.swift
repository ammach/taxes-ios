//
//  Activite.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation

class Activite {
    
    let id:CLong
    let nom:String
    
    let commune:Commune


    init(id:CLong,nom:String,commune:Commune){
    
    
        self.id=id
        self.nom=nom
        self.commune=commune
    }
    
}