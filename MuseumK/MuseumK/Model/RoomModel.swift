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
    var immersiveName: String
}

// Room 데이터 모델 배열 정의
var rooms = [
    Room(name: "Room A", imageName: "KoreaPos", title: "고려관", isLocked: false, immersiveName: "Immersive"),
    Room(name: "Room B", imageName: "ShinraPos", title: "신라관", isLocked: false, immersiveName: "Immersive2"),
    Room(name: "Room C", imageName: "LatchImage", title: "", isLocked: true, immersiveName: ""),
    Room(name: "Room D", imageName: "LatchImage", title: "", isLocked: true, immersiveName: "")
]
