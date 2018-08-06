class Payment < ApplicationRecord
	validates_presence_of :bank_ifsc_code, :bank_account_number, :amount, :merchant_transaction_ref, :transaction_date, :payment_gateway_merchant_reference
	
	def create_string payment
		string=""
	    payment.keys.each do |key|
	      string +=key+"="+payment[key]+"|"
	    end
	    sha_key=create_sha_digest string
	    string += "hash="+sha_key
	    encrypted = aes128_encrypt("secret 123",string)
	    decrypted = aes128_decrypt("secret 123", string)
	    binding.pry
	end

	def create_sha_digest string
		Digest::SHA1.hexdigest string
	end

	def aes128_encrypt(key, data)
	  key = Digest::MD5.digest(key) if(key.kind_of?(String) && 16 != key.bytesize)
	  aes = OpenSSL::Cipher.new('AES-128-CBC')
	  aes.encrypt
	  aes.key = key
	  aes.update(data) + aes.final
	end

	def aes128_decrypt(key, data)
	  key = Digest::MD5.digest(key) if(key.kind_of?(String) && 16 != key.bytesize)
	  aes = OpenSSL::Cipher.new('AES-128-CBC')
	  aes.decrypt
	  aes.key = Digest::MD5.digest(key)
	  aes.update(data) + aes.final
	end


end
