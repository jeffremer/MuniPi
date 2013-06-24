require 'rubygems'
require 'bundler/setup'

require 'colored'
require 'json'
require 'muni'

require 'socket'

PORT = 4481

print "🚍   " << "Welcome to MuniPi".bold.green_on_blue
3.times {sleep 0.1; print "."; sleep 0.33; }
print "finding routes".yellow
3.times {sleep 0.1; print "."; sleep 0.33; }

r21 = Muni::Route.find(21)
puts
puts "Found route: ".green << r21.title.black_on_white
print "Starting up server".yellow
3.times {sleep 0.1; print "."; sleep 0.33; }
puts "server is up at: ".green << " localhost:#{PORT}".black_on_white

Socket.tcp_server_loop(PORT) do |connection|
  begin
    predictions = r21.outbound.stop_at("Hayes and Laguna").predictions.map do |prediction|
      prediction.epochTime.to_i / 1000
    end
    
    output = {
      r21: predictions
    }
    connection.write(output.to_json)
  rescue
    connection.write({}.to_json)
  end

  connection.close
end