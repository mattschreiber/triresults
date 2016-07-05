class Address
	attr_accessor :city, :state, :location 

	def initialize(hash=nil)
		if !hash.nil?
			@city = hash[:city].nil? ? nil : hash[:city]
			@state = hash[:state].nil? ? nil : hash[:state]
			@location = hash[:loc].nil? ? nil : Point.new(hash[:loc][:coordinates][0], hash[:loc][:coordinates][1])
		end
	end

	def mongoize
		{city: @city, state: @state, loc: Point.mongoize(@location)}
	end

	def self.demongoize(hash)
		if hash.nil?
			nil
		else
			Address.new(hash)
		end
	end

	def self.mongoize(hash)
		if hash.is_a? Address
			hash.mongoize
		else 
			hash
		end
	end

	def self.evolve(hash)
		if hash.is_a? Address
			hash.mongoize
		else 
			hash
		end
	end

end