//
//  ContentView.swift
//  APItest
//
//  Created by Joe McGuinness on 30/04/2021.
//

import SwiftUI

struct ContentView: View {
	
	@State var data = TacoData(baseLayer: BaseLayerData(name: "base"),
	seasoning: SeasoningData(name: "seasoning name"),
	condiment: CondimentData(name: "test"),
	mixin: MixinData(name: "test"),
	shell: ShellData(name: "test"))
	
	func getData() {
		let urlString = "http://taco-randomizer.herokuapp.com/random/"
		let url = URL(string: urlString)
		
		
		URLSession.shared.dataTask(with: url!) {data, _, error in
			DispatchQueue.main.async {
				if let data = data {
					do {
						let decoder = JSONDecoder()
						let decodedData = try decoder.decode(TacoData.self, from: data)
						self.data = decodedData
					} catch {
						print ("Error getting data!!")
					}
				}
			}
		}.resume()
		
	}
	
    var body: some View {
		Text("\(data.baseLayer.name)").font(.headline)
		VStack(alignment: .leading, spacing: 5, content: {
			Text("Seasoning: \(data.seasoning.name)")
			Text("Salad: \(data.mixin.name)")
			Text("Sauce: \(data.condiment.name)")
			Text("Shell: \(data.shell.name)")
		})
		Button("Refresh data") {getData()}
	}
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//		ContentView(data: TacoData)
//    }
//}
