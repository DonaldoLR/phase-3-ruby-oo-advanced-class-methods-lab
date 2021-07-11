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
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(searching_title)
    self.all.find {|song| song.name == searching_title}
  end
  
  def self.find_or_create_by_name(searching_title)
    if self.find_by_name(searching_title)
      self.find_by_name(searching_title)
    else 
      self.create_by_name(searching_title)
    end
  end

  def self.alphabetical 
    self.all.map.sort {|song, song_b| song.name <=> song_b.name}
  end
  
  def self.new_from_filename(file_name)
    parsed_file = file_name.split(/-|\./)
    artist_name = parsed_file[0].strip
    song_name = parsed_file[1].strip

    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

  def self.destroy_all 
    self.all.clear
  end
end
