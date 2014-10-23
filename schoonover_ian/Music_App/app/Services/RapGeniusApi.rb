module RapGeniusApi

def self.search_for_artist(artist)
	artist_search = RapGenius.search_for_artist(artist)
	artist_search.each do |song|
		puts "Song Title: #{song.title}, Song ID: #{song.id}"
		get_song_info(song.id)
	end
end

def self.get_song_info(song_id)
	song = RapGenius::Song.find(song_id)
	puts "Song URL: #{song.url}, Song Description: #{song.description}"	
end

end