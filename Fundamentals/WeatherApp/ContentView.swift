//
//  ContentView.swift
//  Fundamentals
//
//  Created by Varun Bagga on 28/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackGroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("LightBlue"))
            
            
            VStack{
                
                CityTextView(cityName: "Delhi, India")
                    
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76 )
                
              
                
                HStack(spacing: 25){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 80)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temp: 80)
                    WeatherDayView(dayOfWeek: "THUR", imageName: "wind.snow", temp: 80)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temp: 80)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temp: 80)
                }
                Spacer()
                
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time")
                }
                Spacer()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek:String
    var imageName:String
    var temp:Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.medium)
            
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 50,height:40)
            
            
            Text("\(temp)°")
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.medium)
        }
    }
}

struct BackGroundView: View {
    
    var topColor : Color
    var bottomColor : Color
    
    var body: some View {
        LinearGradient(gradient:Gradient(colors: [topColor,bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View{
    
    var cityName : String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var imageName : String
    var temp : Int
    
    var body: some View {
        VStack(spacing: 12){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}


struct WeatherButton : View{
    var title : String
    var body : some View{
        Text(title)
            .frame(width: 280,height: 50)
            .background(Color.white)
            .font(.headline)
            .cornerRadius(19)
    }
}
