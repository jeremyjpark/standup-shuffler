require 'sinatra'
require 'httparty'
require 'yaml'

data = YAML.load_file(File.expand_path("./data.yml"))

post('/') do
  puts data['team_members'].shuffle.join(', ')
  HTTParty.post(data['url'], body: { text: data['team_members'].shuffle.join(', '), channel: "\##{params['channel_name']}", icon_emoji: ':twisted_rightwards_arrows:', username: 'STANdup' }.to_json )
end
