//
//  ContentView.swift
//  Shared
//
//  Created by Ranjit Singh on 25/08/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView{
            FriendsListView(viewModel: FriendsListViewModel())
        }
        
    }
}


