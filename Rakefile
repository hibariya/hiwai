require 'bundler'

Bundler.require

Bundler::GemHelper.install_tasks
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

namespace :dic do
  desc 'Expand dictionary from STDIN'
  task :expand do
    print Hiwai::CensorableWords.load(STDIN.read).join("\n")
  end

  desc 'Serialize dictionary from STDIN'
  task :serialize do
    print Hiwai::CensorableWords.dump(STDIN.read.split("\n"))
  end

  desc 'Add new words in interactive mode,'
  task :interactive do
    puts "To commit, exit by ctrl+d.\nTo rollback, interrupt by ctrl+c."
    prompt = -> { print 'new hiwai word > ' }.tap(&:[])
    changes = []

    trap :EXIT do
      if changes.any?
        File.open(Hiwai.dictionary, 'w') do |f|
          f.write Hiwai::CensorableWords.dump(Hiwai.censorable_words + changes)
        end

        puts 'Committed successfully.'
      end
    end

    trap :INT do
      changes.clear
      puts "\nRollbacked."
      prompt[]
    end

    while input = STDIN.gets
      word = input.strip.force_encoding(Encoding::UTF_8)

      if Hiwai.censorable_words.index(word)
        puts "#{word} is already exists."
      else
        unless word.empty?
          changes << word
          puts "#{word} was added."
        end
      end

      prompt[]
    end
  end
end

task default: :spec
