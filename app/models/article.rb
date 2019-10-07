class Article < ApplicationRecord
	validates :title, :text, presence: true
	has_many :comments

	attr_accessor :regenerate_permalink

	before_save :set_permalink

	def subject
		title
	end

	def last_comment
		comments.last
	end

	def generate_permalink(count=0)
		 new_permalink = title.parameterize[0..49]

		 if count > 0
			new_permalink += "-#{count}"
		 end

		 if Article.where.not(id: id).find_by(permalink: new_permalink)
			new_permalink = generate_permalink(count + 1)
		 end

		 new_permalink
	end

	def to_param
		permalink
	end

	private
	def set_permalink
		if regenerate_permalink.to_i > 0 || (new_record? && !permalink?)
			self.permalink = generate_permalink
		end
	end
end
