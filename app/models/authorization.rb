class Authorization < ActiveRecord::Base
	belongs_to :user

	after_create :fetch_details



	def fetch_details
		self.send("fetch_details_from_#{self.provider.downcase}")
	end


	def fetch_details_from_facebook
		graph = Koala::Facebook::API.new(self.token)
		facebook_data = graph.get_object("me")
		self.username = facebook_data['username']
		self.save
    self.user = User.new if self.user.nil?
    self.user.username = facebook_data['username'] if self.user.username.blank?
    self.user.name = facebook_data['name'] if self.user.name.blank?
    self.user.remote_image_url = "http://graph.facebook.com/" + self.username + "/picture?type=large" if self.user.image.blank?
		self.user.location = facebook_data['location'] if self.user.location.blank?
		self.user.save
	end

	def fetch_details_from_twitter
    client = Twitter::REST::Client.new do |config|
      if Rails.env.development?
        config.consumer_key        = "OOv3GL672ZCM5rGCZ1WqMA"
        config.consumer_secret     = "HnxDM15lCgMZtiyQ93Gsnbx5z9991EqqSTdZDpQ"
        config.access_token        = "15336176-JoWc2rIQaVNT3mK3GDffjQWn7S5iz4ig0ZnaxzbxF"
        config.access_token_secret = "aeYDwdHWCxDDjjdsHwjHrqS8hM0o0YCHpn1HwswbMFJjf"
      else
        config.consumer_key        = "MNplaWRvANhleKluPIlXQQ"
        config.consumer_secret     = "0nJcRLu2FkRb6hkHMnlgjQLZB7PwFawRre5C1gbBbk"
        config.access_token        = "15336176-0zzVhAVZuoOWvNxHmnNsnh7kIGHncYwgbNXKZUAYi"
        config.access_token_secret = "90CihYTEtgCoIEvV8pAaK0HtNgCguk2yaekZuRmUMx4Rz"
      end
    end

    twitter_data = client.user
		self.username = twitter_data.username
		self.save
		self.user.username = twitter_data.username if self.user.username.blank?
		self.user.remote_image_url = twitter_data.profile_image_url if self.user.image.blank?
		self.user.location = twitter_data.location if self.user.location.blank?
		self.user.save(:validate => false)
	end


	def fetch_details_from_github
	end


	def fetch_details_from_linkedin

	end

	def fetch_details_from_google_oauth2

	end
end
