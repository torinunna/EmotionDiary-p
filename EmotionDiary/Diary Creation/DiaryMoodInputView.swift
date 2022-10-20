//
//  DiaryMoodInputView.swift
//  EmotionDiary
//
//  Created by YUJIN KWON on 2022/10/12.
//

import SwiftUI

struct DiaryMoodInputView: View {
    
    @ObservedObject var vm: DiaryViewModel
    
    let moods: [Mood] = Mood.allCases
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach(moods, id:\.self) { mood in
                    Button {
                        print("Mood Selected")
                        vm.mood = mood
                    } label: {
                        
                        VStack {
                            Image(systemName: mood.imageName)
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 80)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                                .padding()
                            Text(mood.name)
                                .foregroundColor(Color.gray)
                        }
                        .frame(height: 180)
                        .background(mood == vm.mood ? Color.gray.opacity(0.4) : Color.clear)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            NavigationLink {
                DiaryTextInputView()
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

struct DiaryMoodInputView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryMoodInputView(vm: DiaryViewModel(isPresented: .constant(false)))
    }
}
