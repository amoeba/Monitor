//
//  ModalTest.swift
//  Monitor (iOS)
//
//  Created by Bryce Mecum on 4/3/21.
//

import SwiftUI

struct ModalTest: View {
    @State var isError: Bool = false

    var body: some View {

        Button("Alert") {
            self.isError = true
        }.alert(isPresented: $isError, content: {
            Alert(title: Text("Error"), message: Text("Error Reason"), dismissButton: .default(Text("OK")))
        })
    }
}

struct ModalTest_Previews: PreviewProvider {
    static var previews: some View {
        ModalTest()
    }
}
