//
//  DiaryDateInputView.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2022/10/12.
//

import SwiftUI

struct DiaryDateInputView: View {

    @StateObject var vm: DiaryViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                DatePicker("Starting Date",
                           selection: $vm.date,
                           displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                
                Spacer()
                
                NavigationLink {
                    DiaryMoodInputView(vm: vm)
                } label: {
                    Text("Next")
                        .frame(width: 200, height: 60)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(40)
                }
            }

        }
        
    }
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(false))
        DiaryDateInputView(vm: vm)
    }
}
