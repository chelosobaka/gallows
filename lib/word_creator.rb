class WordCreator
   def self.create_word
    word = ARGV[0]
    if word == nil || word == ""
      begin
        file = File.open("data/dictionary.txt",'r:UTF-8')
        dictionary = file.readlines
        file.close

        dictionary.sample.chomp
      rescue Errno::ENOENT
        abort "Словарь не найден."
      end
    else
      if /[а-яА-Я]{4,}/ =~ word.encode("UTF-8")
        word.downcase.chomp.encode("UTF-8")
      else
        abort "Не меньше 4-ёх символов."
      end
    end
  end

end


