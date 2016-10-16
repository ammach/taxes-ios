//
//  InfoNotification.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation



class InfoNotification {

    let id:CLong
    
    let dernierDateNotificationBoisson=NSDateFormatter()
    
    let dernierDateNotificationSejour=NSDateFormatter()
    
    let dernierDateNotification38=NSDateFormatter()
    
    let dernierDateNotificationTnb=NSDateFormatter()
    let type:Int //1 ,2 ,3
    
    init(id:CLong,type:Int){
        self.id=id
        self.type=type
    }
}