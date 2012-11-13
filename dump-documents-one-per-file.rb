require 'json'

doc = JSON.parse(File.read(File.join(File.dirname(__FILE__), 'data/json/code4lib-2013-chicago-il.json')))

Dir.chdir(File.join(File.dirname(__FILE__), 'data')) do 
	Dir.mkdir('talks') unless File.exists? 'talks'
    doc.each do |x|
      File.open("talks/" + x['id'].to_s, 'w') { |f| f.puts "#{x['title']}\n#{x['description']}"}
    end
end