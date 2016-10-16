//
//  Zone.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class Zone {
    
    let id:CLong
    let  nom:String
    let  secteure:Secteure
    
    init(id:CLong,nom:String,secteure:Secteure){
    
        self.id=id
        self.nom=nom
        self.secteure=secteure
    }

}