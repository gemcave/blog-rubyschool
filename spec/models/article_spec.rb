require 'rails_helper'

describe Article do
	describe "validations" do
		it { should validate_presence_of :text }
		it { should validate_presence_of :title }
	end

	describe "validations" do
		it { should have_many :comments }
	end

	describe "#subject" do
		it "returns the article title" do
			article = create(:article, title: 'Lorem Ipsum')

			expect(article.subject).to eq 'Lorem Ipsum'
		end
	end
	
	describe "#last_comment" do 
		it "return the last comment" do
		end
	end
end