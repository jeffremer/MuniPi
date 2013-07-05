require 'rubygems'
require 'bundler/setup'

require 'colored'
require 'json'
require 'muni'
require 'socket'

PORT = 4481


begin
  config = YAML::load_file "config.yml"  
rescue Exception => e
  puts("Please provide a config.yml file (see config.yml.sample)".red)
  exit 1
end


print "🚍   " << "Welcome to MuniPi".bold.green_on_blue
3.times {sleep 0.05; print "."; sleep 0.15; }
print "serving routes".yellow << " [" << config.keys.join(',') << "]"
3.times {sleep 0.05; print "."; sleep 0.15; }

Socket.tcp_server_loop(PORT) do |connection|
  begin
    response = {}
    config.each do |route, directions|
      response[route] = directions.map do |direction, stop_tag|
          Muni::Route.find(route).send(direction).stop_at(stop_tag.to_s).predictions.map do |prediction|
            prediction.epochTime.to_i / 1000
          end
      end
    end
    connection.write(response.to_json)
  rescue Exception => e
    puts e
  end
  connection.close
end