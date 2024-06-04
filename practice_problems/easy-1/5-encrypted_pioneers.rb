# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.
# Write a program that deciphers and prints each of these names .

names_list = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"

encrypted_names = names_list.split("\n")

LETTERS_UPCASE = ('A'..'Z').to_a
LETTERS_DOWNCASE = ('a'..'z').to_a

def decrypt_rot13(string)
  # circular so intuition is use mod over 26 values (indices 0..25)
  # each index value corresponds to alphabet value

  # algo
  # iterate by letter
    # find index of letter (two sets of letters to handle both cases)
      # if doesn''t exist (ie space) - concat space
      # else concat letter at (index + 13) % 26
  string.chars.reduce('') do |decrypted_str, char|
    rotated_char = rotate_13(char, LETTERS_UPCASE) || rotate_13(char, LETTERS_DOWNCASE)
    decrypted_str << (rotated_char ? rotated_char : char)
  end
end

def rotate_13(char, alphabet)
  alphabet.index(char) ? alphabet[(alphabet.index(char) + 13) % 26] : nil
end

encrypted_names.each { |name| p decrypt_rot13(name) }

# Solution
# actually simplar to understand: forgot about ord and chr to convert to and from ascii
def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

# ENCRYPTED_PIONEERS.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end

#using String#tr - selector and replacement arguments (can be range - positional)

def rot13(encrypted_text)
  encrypted_text.tr('a-zA-Z', 'n-za-mN-ZA-M')
end

p rot13('Nqn Ybirynpr')

# Another DS - using hash where key value pairs are letter with its corresponding rotated counterpart

# extending the functionality of the String class:
class String
  def title_case
    split.map(&:capitalize!).join(" ")
  end
end

# creating custom Proc object:
key = Proc.new do |chr|
        half_1 = ("a".."m").to_a
        half_2 = ("n".."z").to_a
        alphabet = (half_1.zip(half_2) + half_2.zip(half_1)).to_h

        chr == " " ? chr : alphabet[chr]
      end

# main method:
def decode(str, key)
  str.downcase.each_char.with_index do |chr, idx|
    str[idx] = key.call(chr)
  end
  str.title_case
end

p decode("Nqn Ybirynpr", key) # => Ada Lovelace
p decode("Tenpr Ubccre", key) # => Grace Hopper
p decode("Nqryr Tbyqfgvar", key) # => Adele Goldstine
p decode("Puneyrf Onoontr", key) # => Charles Babbage
