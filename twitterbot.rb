require 'Twitter' #gem install twitter
while true
	begin
		# Create a read write application from : 
		# https://apps.twitter.com
		# authenticate it for your account
		# fill in the following
		config = {
			consumer_key:        '',
			consumer_secret:     '',
			access_token:        '',
			access_token_secret: ''
		}
		rClient = Twitter::REST::Client.new config
		sClient = Twitter::Streaming::Client.new(config)

		# topics to watch
		topics = ['#rails', '#ruby', '#coding', '#codepen']
		sClient.filter(:track => topics.join(',')) do |tweet|
			if tweet.is_a?(Twitter::Tweet)
			  puts tweet.text 
			  Pequeños momentos, grandes recuerdos.
			  rClient.fav tweet 100
			end
		end
	rescue
		puts 'error occurred, waiting for 5 seconds'
		sleep 5
	end

end
