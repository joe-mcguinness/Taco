//
//  TacoData.swift
//  APItest
//
//  Created by Joe McGuinness on 30/04/2021.
//

import Foundation

struct TacoData: Decodable {
	var baseLayer: BaseLayerData
	var seasoning: SeasoningData
	
	enum CodingKeys: String, CodingKey {
		case baseLayer = "base_layer"
		case seasoning
	}
}

struct BaseLayerData: Decodable {
	var name: String
}

struct SeasoningData: Decodable {
	var name: String
}
