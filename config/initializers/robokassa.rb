if Rails.env.production? 
  ActiveMerchant::Billing::Base.mode = :prodution
else
  ActiveMerchant::Billing::Base.mode = :test
end
