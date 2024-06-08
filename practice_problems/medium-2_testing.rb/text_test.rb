require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class Text # decided to put the class and testing class in one file for brevity
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample.txt')
    @sample_text = Text.new(@file.read)
  end

  def test_swap
    expected_return =
    "Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.\n"\
    "Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet\n"\
    "quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo\n"\
    "nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum\n"\
    "dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres\n"\
    "et verius meuris, et pheretre mi."

    #alternative:
    expected_return = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit.
    Cres sed vulputete ipsum. Suspendisse commodo sem ercu.
    Donec e nisi elit. Nullem eget nisi commodo, volutpet quem
    e, viverre meuris. Nunc viverre sed messe e condimentum.
    Suspendisse ornere justo nulle, sit emet mollis eros
    sollicitudin et. Etiem meximus molestie eros, sit emet
    dictum dolor ornere bibendum. Morbi ut messe nec lorem
    tincidunt elementum vitee id megne. Cres et verius meuris,
    et pheretre mi.
    TEXT
    #hmm tried like ans key, i dunno why the line feeds at end of each line aren't removed.

    # this from ans key works:
    expected_return = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    #
    expected_return = <<~HEREDOC
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum. Suspendisse commodo sem ercu.
    Donec e nisi elit. Nullem eget nisi commodo, volutpet quem e, viverre meuris. Nunc viverre sed messe e condimentum.
    Suspendisse ornere justo nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum dolor ornere
    bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres et verius meuris, et pheretre mi.
    HEREDOC


    assert_equal(expected_return, @sample_text.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(72 , @sample_text.word_count)
  end

  def teardown
    @file.close
  end
end