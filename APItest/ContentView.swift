//
//  ContentView.swift
//  APItest
//
//  Created by Joe McGuinness on 30/04/2021.
//

import SwiftUI

struct ContentView: View {
	
	@State var data = TacoData(baseLayer: BaseLayerData(name: "base"),
	seasoning: SeasoningData(name: "seasoning name"))
	
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
		VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
			Button("Refresh data") {getData()}
			Text("\(data.baseLayer.name)").font(.title)
			Text("\(data.seasoning.name)")
			}
		)
	}
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//		ContentView(data: TacoData)
//    }
//}
