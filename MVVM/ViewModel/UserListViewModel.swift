//
//  UserListViewModel.swift
//  MVVM
//
//  Created by cmStudent on 2021/11/18.
//

import Foundation

struct UserListViewModel {
    var users: Observable<[UserCellViewModel]> = Observable([])
}
