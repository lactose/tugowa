class HomeController < ApplicationController
  def index
    @preorder = Preorder.new
    @title = "tugowa" 
  end
  def create
    @preorder = Preorder.new(params[:preorder])

    respond_to do |format|
      if @preorder.save
        format.html {
          redirect_to "home#index"
          flash[:success] = 'Thanks! We\'ll let you know when things are cooking.'
        }
        format.json { render json: @preorder, status: :created, location: @preorder }
      else
        format.html { render action: "index" }
        @title = "tugowa"
        format.json { render json: @preorder.errors, status: :unprocessable_entity }
      end
    end
  end

end

