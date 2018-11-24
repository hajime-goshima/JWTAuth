class JwtBlackList < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist
end
