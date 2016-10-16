//
//  CategorieHabitation.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation



class CategorieHabitation {


    let locale:Locale
    
    let id:CLong
    let designation:String
    
    init(locale:Locale,id:CLong,designation:String){
    
        self.id=id
        self.locale=locale
        self.designation=designation
    }

}