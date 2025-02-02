class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project! weiner" }.to_json
  end

  get "/books" do
    book_all = Book.all
    book_all.to_json(include: :comments)
  end 

  get "/books/:title" do
    book_titles = Book.where(title: params[:title])
    book_titles.to_json
  end

   get "/ages" do
    age_all = Age.all
    age_all.to_json
  end 

  get "/comments" do
    best_all = Comment.all
    best_all.to_json
  end 
  get "/book/:title" do
    book = Book.where("title LIKE ?" "%#{params[:title]}%")
    book.to_json
  end

  patch "/comments/:id" do 
    commentary = Comment.find(params[:id])
    Comment.update({comment:params[:comment]})
    commentary.to_json
  end 

  post "/comments" do 
    commentary = Comment.create({comment:params[:comment], book_id:params[:book_id]})
    commentary.to_json
  end

  delete "/comments/:id" do 
    commentary = Comment.find(params[:id])
    commentary.destroy
    commentary.to_json
  end
  
end
