//
//  Ville.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class Ville {
    
    var  id:CLong?
    var  nom:String?
    var communes:[Commune]?
    
    init(id:CLong,nom:String,communes:[Commune]){
    
        self.id=id
        self.nom=nom
        self.communes=communes
    }
    
    init(nom:String){
      self.nom=nom
    }

}