require 'spec_helper'

describe PostsController do
	describe "ajax get index" do
		before(:each) do
			@post = stub_model(Post)
			Post.stub(:all) { [@post] }
			request.accept = "application/json"
		end

		it "assigns to @posts" do
			get :index
			expect(assigns(:posts)).to eq([@post])
		end

		it "renders json" do
			PostSerializer.should_receive(:new)
			get :index
			expect(response.header['Content-Type']).to include 'application/json'
		end
	end

	describe "show, destroy, update, and create" do
		before(:each) do
			@post = stub_model(Post)
			Post.stub(:find).with("#{@post.id}") { @post }
			request.accept = "application/json"
		end

		describe "ajax get show" do
			it "assigns to @post" do
				get :show, :id => @post.id
				expect(assigns(:post)).to eq(@post)
			end

			it "renders json" do
				PostSerializer.should_receive(:new)
				get :show, :id => @post.id
				expect(response.header['Content-Type']).to include 'application/json'
			end
		end

		describe "ajax delete destroy" do
			it "assigns to @post" do
				@post.stub(:destroy)
				delete :destroy, :id => @post.id
				expect(assigns(:post)).to eq(@post)
			end

			it "destroys the record" do
				@post.should_receive(:destroy)
				delete :destroy, :id => @post.id
			end
		end

		describe "ajax put update" do
			def update_post
				put :update, :id => @post.id, :post => {"title" => 'new title', "body" => 'new body'}
			end

			it "assigns to @post" do
				update_post
				expect(assigns(:post)).to eq(@post)
			end

			it "updates the record" do
				@post.should_receive(:update_attributes).with("title" => 'new title', "body" => 'new body')
				update_post
			end		
		end

		describe "ajax post create" do
			def create_post
				post :create, :post => {"title" => 'new title', "body" => 'new body'}
			end

			it "creates to record" do
				Post.should_receive(:create).with("title" => 'new title', "body" => 'new body')
				create_post
			end
		end
	end

end
