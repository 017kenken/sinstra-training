require "sinatra"
require "sinatra/reloader"
require "active_record"
=begin
require "rack/csrf"

use Rack::Session::Cookie, secret: "thisissomethingsecrettraining"
use Rack::Csrf, raise: true
=end
ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "./blog.db"
)

class Post < ActiveRecord::Base
    validates :body, presence: true
end

before do 
    @posts = Post.all
end

get "/tlist" do
    @title = "my blog"
    erb :tlist
end

get '/show/:id' do 
    @title = "my blog"
    @post = Post.find(params[:id])
    erb :show
end

get "/newp" do
    @title = "my blog"
    erb :newp
end

get "/main" do
    @title = "my blog"
    erb :main
end

post "/create" do
    Post.create({
    title: params[:title],
    body: params[:body]})
    redirect to ("/main")
end

post "/destroy" do
    Post.find(params[:id]).destroy
end

