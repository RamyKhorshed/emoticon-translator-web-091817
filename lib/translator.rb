require "yaml"
require "pry"

def load_library(filepath)
  library = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(filepath).each do |meaning, array|
    english, japanese = array
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
  end
  library
end

def get_japanese_emoticon(filepath,input)
  library = load_library(filepath)
  result = library["get_emoticon"][input]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_meaning"][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end
