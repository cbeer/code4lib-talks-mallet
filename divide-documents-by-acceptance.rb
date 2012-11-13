require 'json'
require 'yaml'

base_path = File.dirname(__FILE__)

min_scores = YAML.load_file(File.join(base_path, 'data/min-scores.yml'))

Dir.glob(File.join(base_path, 'data/json/*.json')).each do |f|
  year_score = min_scores[File.basename(f, '.json')]
  next if year_score.nil?

  doc = JSON.parse(File.read(f))

  accepted, not_accepted = doc.partition { |x| x['score'] >= year_score }

  Dir.chdir(File.join(base_path, 'data')) do
  	unless File.exists? 'partitioned_talks'
      Dir.mkdir('partitioned_talks') 
      Dir.mkdir('partitioned_talks/accepted')
      Dir.mkdir('partitioned_talks/not_accepted')
    end

  Dir.chdir('partitioned_talks/accepted') do
    accepted.each do |x|
      File.open(x['id'].to_s, 'w') { |f| f.puts "#{x['title']}\n#{x['description']}"}
    end
  end

  Dir.chdir('partitioned_talks/not_accepted') do
    not_accepted.each do |x| 
      File.open(x['id'].to_s, 'w') { |f| f.puts "#{x['title']}\n#{x['description']}"}
    end
  end
  end
end