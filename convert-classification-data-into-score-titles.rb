require 'csv'

CSV.read('data/mallet/classified-talks', 'r', :col_sep => "\t").map do |row|
  talk_id = row.first.scan(/\d+$/).first

  title = File.read("data/talks/#{talk_id}").split("\n").first
  score = row[2].to_f - row[4].to_f

  {:title => title, :score => score}

end.sort_by { |x| x[:score]}.reverse.each do |x|
  puts "#{x[:score]} -- #{x[:title]}"
end