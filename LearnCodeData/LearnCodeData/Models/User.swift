//
//  User.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 15/03/2023.
//

import Foundation


struct User: Encodable, Decodable {
    let email: String
    let password: String
    let image: String
    let name: String
}

let userDefault = User(email: "email@email.com",
                       password: "123456",
                       image: "https://image.lag.vn/upload/news/20/12/09/chu-meo-co-khuon-mat-poker-face-02c18c34e71b8cdd09e281d8c2a15887_VADB.jpg",
                       name: "Nguyen Meo")


