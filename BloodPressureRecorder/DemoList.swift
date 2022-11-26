//
//  DemoList.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 26/11/22.
//

import SwiftUI

struct DemoList: View {
    @ObservedObject private var viewModel = UserViewModel()
    var body: some View {
        NavigationView {
                    List(viewModel.users) { user2 in
                        VStack(alignment: .leading) {
                            Text(user2.systole).font(.title)
                            Text(user2.diastole).font(.subheadline)
                            Text(user2.bpm).font(.subheadline)
                            Text(user2.comment).font(.subheadline)
                        }
                    }.navigationBarTitle("Users")
                    .onAppear() {
                        self.viewModel.fetchdata()
                    }
                }
            }
    }


struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        DemoList()
    }
}
