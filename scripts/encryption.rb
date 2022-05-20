# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# TODO:
# 1. encrypt a secret and puts encrypted string
# 2. decrypt the encrypted string
# 3. check if decrypted value matches secret

secret = "tacos"
encrypted_secret = BCrypt::Password.create(secret)
# we will get a different output each time we do rails runner on this 
puts encrypted_secret

decrypted_secret = BCrypt::Password.new(encrypted_secret)

puts decrypted_secret

puts "Is the password 'tacos'?"
puts decrypted_secret == "tacos"