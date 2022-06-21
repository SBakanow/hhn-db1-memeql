class AccessPatterns
    class << self 
        def showAllFrankhauserSongs
            Song.joins(:artist).where("last_name = ?", "Frankhauser")
        end

        def createNewFrankhauserSong
            frankhauser = Artist.find_by("last_name = ?", "Frankhauser")
            Song.create(title: "Weeper (Original Mix)", duration: 407, released_at: Date.new(2011,3,7), artist: frankhauser)
        end

        def addNewSongToDivideAlbum
            ed_sheeran = Artist.find_by("last_name = ?", "Sheeran")
            divide = Album.find_by("name = ?", "DIVIDE")
            Song.create(title: "Eraser", duration: 228, released_at: Date.new(2017,3,3), artist: ed_sheeran, album: divide)
        end

        def deleteSongIslandary
            Song.destroy_by("title = ?", "Islandary")
        end
        
        def addNewFrankhauserSongToSergejsPlaylist
            my_playlist = Playlist.find_by("name = ?", "My Playlist")
            new_song = Song.find_by("title = ?", "Weeper (Original Mix)")
            my_playlist.songs << new_song
        end

        def deleteSergejsSubscriptionToEdSheeran
            sergej = User.find_by("name = ?", "Sergej")
            ed_sheeran = Artist.find_by("last_name = ?", "Sheeran")
            sergej.artists.delete(ed_sheeran)
        end

        def updateNameOfUserMarvin
            marvin = User.find_by("name = ?", "Marvin")
            marvin.name = "Marvilicous"
            marvin.save
        end

        def updateGenreOfAlbumWaitForItEP
            wait_for_it_ep = Album.find_by("name = ?", "Wait for it EP")
            wait_for_it_ep.genre = "Electronic"
            wait_for_it_ep.save
        end

        def deleteEdSheeran
            Artist.destroy_by("last_name = ?", "Sheeran")
        end
    end
end