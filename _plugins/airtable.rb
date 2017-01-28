require 'json'
require 'airtable'
require 'active_support/all'

# Pass in api key to client
@client = Airtable::Client.new("keyRTLlrVS02vC3Vx")
# Pass in the app key and table name
@table = @client.table("app7L2RuW1vOAH3HA", "Photos")
@records = @table.records(:sort => ["Date", :desc], :limit => 50)

File.open("_data/photos.json", "w") do |f|
    data = @records.map { |record| record.attributes }
    f.write(data.to_json)
end

