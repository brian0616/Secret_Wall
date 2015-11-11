class CategoriesController < ApplicationController

	def work
		@works = Secret.where("category like?", "%work%")
	end
	def life
		@lives = Secret.where("category like?", "%life%")
	end
	def love
		@loves = Secret.where("category like?", "%love%")
	end
	def money
		@moneys = Secret.where("category like?", "%money%")
	end
	def sex
		@sexes = Secret.where("category like?", "%sex%")
	end
	def relationships
		@relationships = Secret.where("category like?", "%relationships%")
	end
	def other
		@others = Secret.where("category like?", "%other%")
	end
end