//
//  CVDataConverterInput.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 16.04.2021.
//


protocol CVDataConverterInput {
    associatedtype MainCVModel
    func convert(item: MainCVModel) -> CollectionMainViewModel
}
