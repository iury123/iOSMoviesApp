//
//  Injector.swift
//  MoviesApp
//
//  Created by Iury Miguel on 30/01/19.
//  Copyright © 2019 Iury Miguel. All rights reserved.
//

import UIKit

protocol Injectable: class {
    var facebookUserRequester: FacebookUserRequester! {get set}
}

struct Injector<ProtocolType, InjectableDataType> {
    typealias InjectorCallback = (ProtocolType, InjectableDataType) -> Void
    let injector: InjectorCallback
    
    init(callback: @escaping InjectorCallback) {
        injector = callback
    }
    
    func inject(into controller: UIViewController, data: InjectableDataType) {
        if let destiny = controller as? ProtocolType {
            injector(destiny, data)
        }
        for child in controller.children {
            inject(into: child ,data: data)
        }
    }
}
