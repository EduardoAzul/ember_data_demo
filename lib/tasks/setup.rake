namespace :data do
	desc "set up some posts"
	task :set_up_posts => :environment do
		Post.delete_all
		1.upto(10) do |i|
			position = ActiveSupport::Inflector::ordinalize(i)
			Post.create(:title => "#{position} post's title", :body => "#{position} post's body")
		end
	end
end