class AccessPatterns
    class << self 
        def showAllSongsOfArtist(last_name)
            Artist.find_by!(last_name: last_name).songs
        end

        def createNewSong(title, duration, released_at, artist)
            Song.create(title: title, duration: duration, released_at: released_at, artist: artist)
        end

        def addNewOrExistingSongToAlbum(song, album)
            album.songs << song
        end

        def deleteSongByTitle(songtitle)
            Song.destroy_by("title = ?", songtitle)
        end
        
        def addNewSongToPlaylist(playlist, song)
            playlist.songs << song
        end

        def deleteSubscriptionToArtist(user, artist)
            user.artists.delete(artist)
        end

        def updateNameOfUser(user, name)
            user.name = name
            user.save
        end

        def updateGenreOfAlbum(album, genre)
            album.genre = genre
            album.save
        end

        def deleteArtistByLastName(last_name)
            Artist.destroy_by("last_name = ?", last_name)
        end
    end
end