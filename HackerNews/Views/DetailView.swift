//
//  DetailView.swift
//  HackerNews
//
//  Created by playground on 14.12.21.
//

import SwiftUI

struct DetailView: View {
    let url: String? 
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "")
    }
}
