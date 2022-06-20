class AccessPatterns
    class << self 
        def allFrankhauserSongs
            Song.joins(:artist).where("last_name = ?", "Frankhauser")
        end

        def allSongsFromPlaylistOfSergej
            
        end
    end
end