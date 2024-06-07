# Reading a file in same directory (from Ruby docs)
File.read('sample.txt')

# Okay, so the read of specific file is defined in `process`
# then each invocation with a different block checks a different type (ie: spaces, paragraphs etc)
# then output will the other end of 'sandwich'

class TextAnalyzer
  def process
    text = File.read('sample.txt')
    result = yield(text)
    puts result
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| "#{text.gsub("\n")} paragraphs"}
analyzer.process { |text| "#{text.count("\n") + 1} lines"}
analyzer.process { |text| "#{text.count(" ") + 1} words"}

# couldn't figure this one out. looked at ans key, shoulda been able to figure this out.
# for this problem though, realistically, it also seems like not a very useful method
# because the onus is on the method user to deduce how to count the various text structures...

# seems better to have the implementations in the #process method and have the caller use
# an argument flag to specify which to process.

analyzer.process { |text| "#{text.split("\n\n").count} paragraphs"}
analyzer.process { |text| "#{text.split("\n").count} lines"}
analyzer.process { |text| "#{text.split(" ").count} words"}

# also i used File.read which auto opens and closes i think, but ans key wanted to illustrate sandwich code:

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end