//
//  RoomModel.swift
//  MuseumK
//
//  Created by hanseoyoung on 7/30/24.
//

import Foundation

struct Room: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var title: String
    var isLocked: Bool
}

// Room 데이터 모델 배열 정의
let rooms = [
    Room(name: "Room A", imageName: "HoguImage", title: "Shilla Royal Runner ‘ Hogu ’", isLocked: false),
    Room(name: "Room B", imageName: "LatchImage", title: "", isLocked: true),
    Room(name: "Room C", imageName: "LatchImage", title: "", isLocked: true),
    Room(name: "Room D", imageName: "LatchImage", title: "", isLocked: true)
]
