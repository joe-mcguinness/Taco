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
	var condiment: CondimentData
	var mixin: MixinData
	var shell: ShellData
	
	enum CodingKeys: String, CodingKey {
		case baseLayer = "base_layer"
		case seasoning
		case condiment
		case mixin
		case shell
	}
}

struct BaseLayerData: Decodable {
	var name: String
}

struct SeasoningData: Decodable {
	var name: String
}

struct CondimentData: Decodable {
	var name: String
}

struct MixinData: Decodable {
	var name: String
}

struct ShellData: Decodable {
	var name: String
}
