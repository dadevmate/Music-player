//
//  AppleMusicView.swift
//  Music player
//
//  Created by Nethan on 24/2/23.
//

import SwiftUI
import WebKit
import MusicKit

struct WebView: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(request)
    }
}

struct Item: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let artistName: String
    let imageURL: URL?
    let albumName: String
    let previewURL: URL
}

struct AppleMusicData {
    struct Song {
        var id: String
        var name: String
        var duration: Int
        var artistName: String
        var albumName: String
        var albumArtworkUrl: URL
        var previewUrl: URL
    }
    
    struct Album {
        var id: String
        var name: String
        var artistName: String
        var genre: String
        var releaseDate: String
        var artworkUrl: URL
        var tracks: [Song]
    }
    
    struct Artist {
        var id: String
        var name: String
        var genreNames: [String]
        var albums: [Album]
        var bio: String?
        var socialLinks: [String: URL]?
    }
    
    struct Playlist {
        var id: String
        var name: String
        var curatorName: String
        var artworkUrl: URL?
        var description: String?
        var tracks: [Song]
        
    }
    
    struct Genre {
        var name: String
        var playlists: [Playlist]
        var artists: [Artist]
    }
}


var requested = "Happy"
let musicTheme = [
    "Acid Jazz",
    "Alternative",
    "Ambient",
    "Bluegrass",
    "Blues",
    "Classical",
    "Country",
    "Dance",
    "Disco",
    "Electronic",
    "Folk",
    "Funk",
    "Gospel",
    "Hard Rock",
    "Heavy Metal",
    "Hip Hop",
    "House",
    "Indie",
    "Jazz",
    "Latin",
    "Metal",
    "New Age",
    "Opera",
    "Pop",
    "Punk",
    "R&B",
    "Reggae",
    "Rock",
    "Soul",
    "Techno",
    "Adele",
        "Beyoncé",
        "Bruno Mars",
        "Coldplay",
        "Drake",
        "Ed Sheeran",
        "Eminem",
        "Foo Fighters",
        "Imagine Dragons",
        "Jay-Z",
        "Kanye West",
        "Kendrick Lamar",
        "Lady Gaga",
        "Lana Del Rey",
        "Madonna",
        "Maroon 5",
        "Metallica",
        "Michael Jackson",
        "Miley Cyrus",
        "Pink Floyd",
        "Queen",
        "Radiohead",
        "Red Hot Chili Peppers",
        "Rihanna",
        "Shakira",
        "Taylor Swift",
        "The Beatles",
        "The Rolling Stones",
        "U2",
        "Whitney Houston",
        "Alicia Keys",
        "Amy Winehouse",
        "Arcade Fire",
        "Ariana Grande",
        "Avril Lavigne",
        "Backstreet Boys",
        "Billie Eilish",
        "Black Sabbath",
        "Blink-182",
        "Bon Jovi",
        "Britney Spears",
        "Bruce Springsteen",
        "Calvin Harris",
        "Cardi B",
        "Carly Rae Jepsen",
        "Celine Dion",
        "Cher",
        "Christina Aguilera",
        "David Bowie",
        "Demi Lovato",
        "Destiny's Child",
        "Dua Lipa",
        "Elton John",
        "Enrique Iglesias",
        "Eric Clapton",
        "Fleetwood Mac",
        "Gorillaz",
        "Green Day",
        "Guns N' Roses",
        "Harry Styles",
        "Hozier",
        "Iggy Pop",
        "Janet Jackson",
        "Jason Derulo",
        "Jennifer Lopez",
        "John Legend",
        "Jon Bon Jovi",
        "Justin Bieber",
        "Justin Timberlake",
        "Katy Perry",
        "Kelly Clarkson",
        "KISS",
        "Lenny Kravitz",
        "Linkin Park",
        "Lorde",
        "Marilyn Manson",
        "Mark Ronson",
        "Meghan Trainor",
        "Metallica",
        "Mumford & Sons",
        "Nirvana",
        "Oasis",
        "One Direction",
        "OutKast",
        "Panic! at the Disco",
        "Paramore",
        "Paul McCartney",
        "Pearl Jam",
        "Phil Collins",
        "Pink",
        "Prince",
        "R.E.M.",
        "Rage Against the Machine",
        "Robbie Williams",
        "Sam Smith",
        "Sia",
        "Stevie Nicks",
        "Stevie Wonder",
        "The Beach Boys",
        "The Doors",
        "The Killers",
        "The Police",
        "The Smiths",
        "The Weeknd",
        "Thirty Seconds to Mars",
        "Tina Turner",
        "Van Halen",
        "Van Morrison",
        "ZZ Top",
    "Butta Bomma",
        "Samajavaragamana",
        "Ramuloo Ramulaa",
        "Rowdy Baby",
        "Ala Vaikunthapurramuloo",
        "Dimaak Kharaab",
        "Vachinde",
        "Pilla Ra",
        "Saranga Dariya",
        "Nee Kannu Neeli Samudram",
        "Undiporaadhey",
        "Kopamga Kopamga",
        "Balega Tagilavey Bangaram",
        "Oohale",
        "Manohari",
        "Pilla Picture Perfect",
        "Yenti Yenti",
        "Maate Vinadhuga",
        "Neeli Neeli Aakasam",
        "Sitharala Sirapadu",
        "Inkem Inkem Inkem Kaavaale",
        "Naalo Chilipi Kala",
        "Priyathama Priyathama",
        "Ninne Ninne",
        "Vellipomaakey",
        "Gira Gira Gira",
        "Adhento Gaani Vunnapaatuga",
        "Choosi Chudangane",
        "Manasa Manasa",
        "Inthena",
        "Crazy Feeling",
        "Ninnu Chuse Anandamlo",
        "Tholi Tholiga Tholakari",
        "Prema O Premaa",
        "Chiniki Chiniki",
        "Rangamma Mangamma",
        "Maahi",
        "Awaara",
        "Thakita Thakajham",
        "Kallajodu College Papa",
        "Neevente Nenunte",
        "Adiga Adiga",
        "Choopultho",
        "Naa Gundello",
        "Nuvvante Na Navvu",
        "Kadhal Psycho",
        "My Love Is Gone",
        "Yentha Sakkagunnave",
        "Emo Emo Emo",
        "Ye Manishike Majiliyo",
        "Laalijo",
        "Nee Kallalona",
        "Nuvvele Nuvvele",
        "Anandam",
        "Yemaindho Teliyadu Naaku",
        "Ee Maya Peremito",
        "Nijamena",
        "Nuvve Nuvve",
        "Naa Hrudayam"
    
]
struct AppleMusicView: View {
    @State var searchText = ""
    @State var songs = [Item]()
    @State var listen = false

    var filteredSongs: [Item] {
        if searchText.isEmpty {
            return songs
        } else {
            
            return songs.filter {$0.name.lowercased().contains(searchText.lowercased())}
        }
    }
    var body: some View {
        NavigationView {
            List(filteredSongs) { song in
                Button {
                    listen = true
                } label: {
                    HStack {
                        AsyncImage(url: song.imageURL)
                            .frame(width: 75, height: 75, alignment: .center)
                        VStack(alignment: .leading) {
                            
                            Text(song.name)
                                .font(.title3)
                            
                            Text(song.artistName)
                                .font(.footnote)
                            
                            Text(song.albumName)
                                .font(.footnote)
                            
                            
                        }
                        .padding()
                    }
                }
                .sheet(isPresented: $listen) {
                    WebView(request: URLRequest(url: song.previewURL))
                }
            }
            .searchable(text: $searchText) {
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                       requested = "Sad"
                        fetchMusic()
                    } label: {
                        Image(systemName: "return.right")
                    }
                }
            }
        }
        .onAppear {
            fetchMusic()
        }
    }
    private var request: MusicCatalogSearchRequest = {

        var request = MusicCatalogSearchRequest(term: "\(musicTheme[Int.random(in: 0...197)])", types: [Song.self])
        request.limit = 25
        print(musicTheme.count)
        return request
    }()
    private func fetchMusic() {
        Task {
            let status = await MusicAuthorization.request()
            switch status {
            case .authorized:
                do {
                    let result = try await request.response()
                    self.songs = result.songs.compactMap({
                        return .init(name: $0.title, artistName: $0.artistName, imageURL: $0.artwork?.url(width: 75, height: 75), albumName: $0.albumTitle!, previewURL: $0.url!)
                    })
                  
                } catch {
                    print(String(describing: error))
                }
            default:
                break
            }
        }
    }
}

struct AppleMusicView_Previews: PreviewProvider {
    static var previews: some View {
        AppleMusicView()
    }
}
