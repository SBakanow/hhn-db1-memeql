class AccessPatterns
    class << self 
        def allFrankhauserSongs
            Song.joins(:artist).where("last_name = ?", "Frankhauser")
        end

        def createNewFrankhauserSong
            frankhauser = Artist.find_by("last_name = ?", "Frankhauser")
            Song.create(title: "Weeper (Original Mix)", duration: 407, released_at: Date.new(2011,3,7), artist: frankhauser)
        end
        
        def sergejAddNewFrankhauserSongToPlaylist
            my_playlist = Playlist.find_by("name = ?", "My Playlist")
            new_song = Song.find_by("title = ?", "Weeper (Original Mix)")
            my_playlist.songs << new_song
        end

        def sergejDeleteSubscriptionToEdSheeran
            sergej = User.find_by("name = ?", "Sergej")
            ed_sheeran = Artist.find_by("last_name = ?", "Sheeran")
            sergej.artists.delete(ed_sheeran)
        end

        def updateNameOfUserMarvin
            marvin = User.find_by("name = ?", "Marvin")
            marvin.name = "Marvilicous"
            marvin.save
        end

        def deleteEdSheeran
            Artist.destroy_by("last_name = ?", "Sheeran")
        end
    end
end