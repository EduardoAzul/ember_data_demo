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

	describe "ajax get show" do
		before(:each) do
			@post = stub_model(Post)
			Post.stub(:find).with("#{@post.id}") { @post }
			request.accept = "application/json"
		end

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
		before(:each) do
			@post = stub_model(Post)
			Post.stub(:find).with("#{@post.id}") { @post }
			request.accept = "application/json"
		end

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

end
