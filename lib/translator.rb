# require modules here
require "yaml"
require "pry"


def load_library(file)
  data=YAML.load_file (file)
  new_hash={"get_meaning":{},"get_emoticon":{}}
  # get_meaning
  #"japanese_emoticon":"meaning"   
  # "☜(⌒▽⌒)☞" => "angel"  
  
  #get_emoticon
  # "english_emoticon":japanese_emoticon
  # O:)" => "☜(⌒▽⌒)☞"
                
data.each do |key,value|
    new_hash[:get_meaning][value[1]]=key
    new_hash[:get_emoticon][value[0]]=data[key][1]
  end
   new_hash
end

def get_japanese_emoticon(file,english_emoticon)
  result=load_library(file)
  trans=result[:get_emoticon][english_emoticon]
  answer_not_found="Sorry, that emoticon was not found"
  
  if trans
    return trans
  else
    return answer_not_found
  end
end

def get_english_meaning(file,japanese_emoticon)
  result=load_library(file)
  trans=result[:get_meaning][japanese_emoticon]
  answer_not_found="Sorry, that emoticon was not found"
  if trans
    return trans
  else 
    return answer_not_found
  end
end