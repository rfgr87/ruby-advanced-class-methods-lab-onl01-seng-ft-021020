class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end
  
  def self.find_by_name(name)
    song = @@all.collect do |x|
      if x.name == name
        x 
      end
      song
    end 
  end
  
  def self.find_or_create_by_name(name)
    song = @@all.collect do |x|
      if x.name == name
        x 
      else
        nil
      end
    end
    if song == nil
      song = self.new
      song.name = name
      song
    end
  end
  
  def self.alphabetical
    sorted = @@all.sort_by{|obj| obj.name}
    return sorted
  end
  
  def self.new_from_filename(filename)
    song_array = filename.split(/[ - ,.mp3]/)
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  
  def self.create_from_filename(filename)
    song_array = filename.split(/[ - ,.mp3]/)
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
