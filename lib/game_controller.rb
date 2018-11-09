class GameController
  MAX_ERRORS = 7
  attr_reader :secret_word, :good_letters, :input_letters, :errors, :game_status

  def initialize(secret_word)
    @secret_word = secret_word.split(//)
    @input_letters = []
    @errors = 0
    @good_letters = []
    @game_status = nil
  end

  def letter_repeat?(letter)
    @input_letters.include?(letter)
  end

  def won?
    @secret_word.uniq.size == @good_letters.size
  end

  def lose?
    @errors == MAX_ERRORS
  end

  def good_letter?(letter)
    @secret_word.include?(letter) ||
    (letter == 'е' && @secret_word.include?('ё')) ||
    (letter == 'ё' && @secret_word.include?('е')) ||
    (letter == 'и' && @secret_word.include?('й')) ||
    (letter == 'й' && @secret_word.include?('и'))
  end

  def add_to_good(letter)
    @good_letters << letter
    case letter
    when 'И' then @good_letters << 'Й'
    when 'Й' then @good_letters << 'И'
    when 'Е' then @good_letters << 'Ё'
    when 'Ё' then @good_letters << 'Е'
    end
  end

  def processing_letter(letter)
    unless letter_repeat?(letter)
      @input_letters << letter
      if good_letter?(letter)
        add_to_good(letter)
        @game_status = :won if won?
      else
        @errors += 1
        @game_status = :lose if lose?
      end
    else
      @game_status = :repeat
    end
  end

  def ask_letter
    letter = STDIN.gets.downcase.chomp.encode("UTF-8")
    @game_status = :processing

    if letter =~ /^[а-я]{1}$/
      processing_letter(letter)
    else
      @game_status = :error
    end
  end

  def vowels
    @secret_word.select{|v| v =~ /[ёуеыаоэяию]/}.size
  end

  def left_errors
    MAX_ERRORS - @errors
  end

end
