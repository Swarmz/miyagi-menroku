require "json"

shops = JSON.parse(File.read(Rails.root.join("db/seeds/shops.json")))

shops.each do |shop|
  Shop.find_or_create_by!(name: shop['name']) do |s|
    s.city    = shop['city']
    s.address = shop['address']
    s.website = shop['website']
  end
end
