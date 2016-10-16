//
//  Locale38Item.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class Locale38Item {

    let id:CLong
    let surface:Double
    let nombreElement:Int
    
    let categorieTauxTaxe38:CategorieTauxTaxe38
    
    let locale:Locale
    let anneeDernierPaiement:Int // jamais paye ==> -1 deja pay ==> >0  n apppartien pas a cette cat ==> -2
    let trimestreDernierPaiement:Int
    
    
    init(id:CLong,surface:Double,nombreElement:Int,categorieTauxTaxe38:CategorieTauxTaxe38,locale:Locale,anneeDernierPaiement:Int ,trimestreDernierPaiement:Int){
    
        self.id=id
        self.surface=surface
        self.nombreElement=nombreElement
        self.categorieTauxTaxe38=categorieTauxTaxe38
        self.locale=locale
        self.anneeDernierPaiement=anneeDernierPaiement
        self.trimestreDernierPaiement=trimestreDernierPaiement
    }

}