client = Twitter::Streaming::Client.new do |config|
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
