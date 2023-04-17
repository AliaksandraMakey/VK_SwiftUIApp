//
//  NewsArray.swift
//  VK_SwiftUI
//
//  Created by aaa on 10/04/2023.
//

import Foundation

// Alex Anna Jane Mari Sveta
var textOne = "Мы идем по земле, встречаем красивых людей, дышим морским бризом, ошибаемся адресом, влюбляемся и расстаемся, падаем и поднимаемся, болеем и выздоравливаем, но продолжаем идти. Завтра погода будет лучше, а дома еще светлее. И речь не о земных доме и погоде. Все начинается и заканчивается внутри нас."
var textTwo = "Правда в том, что сейчас имеет гораздо большее значение, чем любой другой момент в вашей жизни"
var textThree = "Добавила фото"

var newsArray = [
    NewsModel(ouner:  "Alex",text: textOne, date: "12.04", photoAvatar: "Alex", photos: nil),
    NewsModel(ouner:  "Sveta", text: textThree, date: "6.04", photoAvatar: "Sveta", photos: ["Alex", "Sveta"]),
    NewsModel(ouner:  "Anna", text: textThree, date: "10.04", photoAvatar: "Anna", photos: ["Anna", "Mari"]),
    NewsModel(ouner:  "Mari", text: textTwo, date: "12.08", photoAvatar: "Mari", photos: nil)
]
