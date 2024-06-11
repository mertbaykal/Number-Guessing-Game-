# Number-Guessing-Game-
A simple number guessing game built with SwiftUI. Players have to guess a randomly generated number within a limited number of tries.
Here's a sample README file for your GitHub repository:

---

# Number Guessing Game (SayiTahminOyunu)

A simple number guessing game built with SwiftUI. Players have to guess a randomly generated number within a limited number of tries.

## Description

The game starts with a home page where the player can navigate to the guessing screen. On the guessing screen, the player has to input their guess and is given hints whether to guess higher or lower. The player wins if they guess the correct number within the allowed attempts. Otherwise, they lose and are shown the result.

## Screenshots

![HomePage](images/homepage.png)
![TahminEkran](images/tahminEkran.png)
![ResultEkran](images/resultEkran.png)

## Features

- Home screen with game title and a play button.
- Guessing screen with input for number guesses, hints, and remaining attempts.
- Result screen showing whether the player won or lost.

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.0+

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/username/SayiTahminOyunu.git
   ```
2. Navigate to the project directory:
   ```sh
   cd SayiTahminOyunu
   ```
3. Open the project in Xcode:
   ```sh
   open SayiTahminOyunu.xcodeproj
   ```
4. Run the project on your simulator or connected device.

## Usage

1. Launch the app.
2. On the home screen, tap "Play Game" to start.
3. Enter your guesses in the text field and tap "Guess".
4. Follow the hints to guess higher or lower.
5. See the result screen to know if you've won or lost.

## Code Overview

### HomePage.swift
The `HomePage` view contains the navigation to the `TahminEkran` (guessing screen).

```swift
struct HomePage: View {
    @State private var toTahminEkran = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 59) {
                Text("Sayi Tahmin Oyunu").font(.system(size: 30)).bold()
                Image("zar").resizable().frame(width: 100,height: 100)
                Button("Play Game") {
                    toTahminEkran = true
                }.frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .shadow(radius: 10)
                    .cornerRadius(18)
            }.navigationDestination(isPresented: $toTahminEkran) {
                TahminEkran()
            }
        }
    }
}
```

### TahminEkran.swift
The `TahminEkran` view handles the game logic, user input, and navigation to the result screen.

```swift
struct TahminEkran: View {
    @State private var toResultEkran = false
    @State private var kalanHak = 5
    @State private var yonlendirme = ""
    @State private var tfTahmin = ""
    @State private var random = 0
    @State private var result = false

    var body: some View {
        VStack(spacing: 59) {
            Text("Kalan Hak: \(kalanHak)").font(.system(size: 30)).bold()
            Text("Yardim: \(yonlendirme)").font(.system(size: 30))
            TextField("tahmin", text: $tfTahmin)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Gues") {
                kalanHak -= 1
                if let tahmin = Int(tfTahmin) {
                    if tahmin == random {
                        toResultEkran = true
                        result = true
                        return
                    }
                    if tahmin > random {
                        yonlendirme = "arttir"
                    }
                    if tahmin < random {
                        yonlendirme = "azalt"
                    }
                    if kalanHak == 0 {
                        result = false
                        toResultEkran = true
                    }
                    tfTahmin = ""
                }
            }.frame(width: 250, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .shadow(radius: 10)
                .cornerRadius(18)
        }.navigationDestination(isPresented: $toResultEkran) {
            ResultEkran(result: result)
        }.onAppear() {
            random = Int.random(in: 0...10)
            print(random)
            // Reset interface
            kalanHak = 5
            yonlendirme = ""
            tfTahmin = ""
        }
    }
}
```

### ResultEkran.swift
The `ResultEkran` view shows the game result to the player.

```swift
struct ResultEkran: View {
    var result = false

    var body: some View {
        VStack(spacing: 100) {
            if result {
                Image("mutlu").resizable().frame(width: 100, height: 100).shadow(color: .green, radius: 10)
                Text("kazandin").font(.system(size: 38)).bold()
                    .shadow(color: .green, radius: 10)
            } else {
                Image("uzgun").resizable().frame(width: 100, height: 100).shadow(color: .red, radius: 10)
                Text("Kaybettin").font(.system(size: 38)).bold()
                    .shadow(color: .red, radius: 10)
            }
        }
    }
}
```

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---

You can copy and paste this content into your GitHub repository's README file.
