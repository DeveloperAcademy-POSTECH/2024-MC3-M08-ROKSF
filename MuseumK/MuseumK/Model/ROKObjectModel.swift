//
//  ROKObjectModel.swift
//  MuseumK
//
//  Created by hanseoyoung on 7/29/24.
//

import SwiftUI
import RealityKitContent

struct ROKObjectModel {
    let ObjectID: UUID = UUID()
    var name: String
    var captionName: String
    var mainPhotoName: String
    var docentPhoto: String
    var docentContent: String
    var video: String
    var volumeID: String
    var author: String
    var detail: String
    var height: String
}

var Objects: [ROKObjectModel] = [
    ROKObjectModel(
        name: "HangAri",
        captionName: "Caption_HangAri",
        mainPhotoName: "main_photo_2.jpg",
        docentPhoto: "docent_photo_2.jpg",
        docentContent: "This is a detailed description of Artifact 2.",
        video: "video_2.mp4",
        volumeID: "HangAri1",
        author: "Author B",
        detail: "Detailed information about Artifact 2.",
        height: "23.4"
    ),
    ROKObjectModel(
        name: "GimaTogi",
        captionName: "Caption_GimaTogi",
        mainPhotoName: "HoguImage",
        docentPhoto: "docent_photo_1.jpg",
        docentContent: "This is a detailed description of Artifact 1.",
        video: "video_1.mp4",
        volumeID: "GimaTogi1",
        author: "Subtext of work, 2024",
        detail: "National treasure (formerly designated National Treasure No. 91), equestrian figure-shaped earthenware is a cultural asset that is very familiar to us. It attracted public attention when it was excavated in 1924, and is still loved by visitors as it is displayed at the National Museum of Korea as a relic representing Silla culture. The figures, who appear to be a master and a servant, are each riding a horse, and the horse rider's clothing and various horse outfits are realistically expressed, making it a very important material that informs us about the lifestyle of Silla people.",
        height: "28.5"

    )

]
