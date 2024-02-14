import Foundation
import Observation

@Observable
class ViewModel {
    var videos: [Video] = []
    var videosIds: Set<Video.ID> = []
    
    init() {
        getVideos()
    }
    
    func getVideos() {
        Task {
            do {
                let apiKey = "You apiKey"
                let searchQuery = "Dani Martin videoclips"
                
                guard let url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=\(searchQuery)&key=\(apiKey)")
                else {
                    return
                }
                
                let (jsonData, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(YouTubeResponse.self, from: jsonData)
                
                let videos = response.items.map { item in
                    return Video(
                        id: item.id.videoId,
                        title: item.snippet.title,
                        thumbnailURL: item.snippet.thumbnails.default.url,
                        videoURL: item.id.videoId
                    )
                }
                
                self.videos = videos
            } catch {
                self.videos = []
            }
        }
    }
    
    func isVideoIdsEmpty() -> Bool {
        videosIds.isEmpty
    }
    
    func getSelectedVideoURL() -> String {
        // Obtén la URL del primer video en la lista
        return videos.first?.videoURL ?? ""
    }
    
    func getSelectedVideoTitle() -> String {
        // Obtén el título del primer video en la lista
        return videos.first?.title ?? "No title"
    }
}
