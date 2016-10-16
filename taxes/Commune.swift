//
//  Commune.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation



class Commune {


    var id:CLong?
    var nom:String?
    var logo:String?
    
    let ville:Ville
    
    var secteures:[Secteure]?
    
    var users:[User]?
    
    var activites:[Activite]?
    
    
    init(id:CLong,nom:String,logo:String,ville:Ville,secteures:[Secteure],users:[User],activites:[Activite]){
    
        self.id=id
        self.nom=nom
        self.logo=logo
        self.ville=ville
        self.secteures=secteures
        self.users=users
        self.activites=activites
    }
    
    init(ville:Ville){
    
        self.ville=ville
    }
    

}