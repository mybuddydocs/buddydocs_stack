# This will allow us to use the following methods
require 'elasticsearch/extensions/test/cluster'
# It will start ES unless if it's already running
config.before :all, elasticsearch: true do
  Elasticsearch::Extensions::Test::Cluster.start() unless
    Elasticsearch::Extensions::Test::Cluster.running?(port: 9200)
end
# It will create all the indexes and load the documents if exists.
config.before :each, elasticsearch: true do
  ActiveRecord::Base.descendants.each do |model|
    if model.respond_to?(:__elasticsearch__)
      begin
        model.__elasticsearch__.create_index!
        model.__elasticsearch__.refresh_index!
      rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
        puts "There was an error creating the elasticsearch index
              for #{model.name}: #{e.inspect}"
      end
    end
  end
end
# After all the tests were done it will stop the ES instance if it's # still running
config.after :suite do
  Elasticsearch::Extensions::Test::Cluster.stop if
    Elasticsearch::Extensions::Test::Cluster.running?(port: 9200)
end
# It will delete the indexes after each test.
config.after :each, elasticsearch: true do
  ActiveRecord::Base.descendants.each do |model|
    if model.respond_to?(:__elasticsearch__)
      begin
        model.__elasticsearch__.delete_index!
      rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
        puts "There was an error removing the elasticsearch index
              for #{model.name}: #{e.inspect}"
      end
    end
  end
end
