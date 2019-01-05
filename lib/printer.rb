class Printer
  def initialize(game)
    @game = game
  end

  def clear
    system 'cls' or 'clear'
  end

  def print_hangman
    begin
      current_path = File.expand_path('.')
      file = File.open("#{current_path}/data/image/#{@game.errors}.txt")
      puts file.readlines
      file.close
    rescue Errno::ENOENT
      puts
    end
  end

  def processing
    welcom
    @game.secret_word.each do |i|
      if @game.good_letters.include?(i)
        print i + "  "
      else
        print "_ "
      end
    end
    puts
    print_hangman
  end

  def welcom
    print "Мы загадали слово, "
    if @game.vowels == 1
      puts "в нём #{@game.vowels} гласная."
    else
      puts "в нём #{@game.vowels} гласных."
    end
  end

  def left_errors
    puts "У вас осталось #{@game.left_errors} попыток"
  end

  def ask_letter
    puts "Введите букву:"
  end

  def print_input_letter
    puts "(#{@game.input_letters.join(", ")})"
  end

  def print_status
    case @game.game_status
    when :won
      puts "Победа! Слово: #{@game.secret_word.join}"
    when :lose
      puts "Вы поиграла. Это было слово #{@game.secret_word.join}."
    when :repeat
      puts
      puts "Это уже было."
      puts
    when :error
      puts
      puts "Ввели не то, что нужно."
      puts
    end
  end
end
