//
//  Observable.swift
//  MVVM
//
//  Created by cmStudent on 2021/11/18.
//

import Foundation

class Observable<T> {
    
    typealias Listener = ((T?) -> Void)
    
    private var listener: Listener?
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping Listener) {
        listener(value)
        self.listener = listener
    }
    
}
