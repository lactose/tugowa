class PreordersController < ApplicationController
  # GET /preorders
  # GET /preorders.json
  skip_before_filter :protect, :only => [:create, :index, :new]

  def index
    @title = "tugowa"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @preorder }
    end
  end
  def create
    @preorder = Preorder.new(params[:preorder])

    respond_to do |format|
      if @preorder.save
        format.html {
          redirect_to @preorder
          flash[:success] = 'Thanks! We will let you know when things are cooking.'
        }
        format.json { render json: @preorder, status: :created, location: @preorder }
      else
        format.html { render action: "index" }
        @title = "tugowa"
        format.json { render json: @preorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /preorders/1
  # GET /preorders/1.json
  def show
    @preorder = Preorder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @preorder }
    end
  end

  # GET /preorders/new
  # GET /preorders/new.json
  def new
    @preorder = Preorder.new
    @title = "tugowa"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preorder }
    end
  end

  # GET /preorders/1/edit
  def edit
    @preorder = Preorder.find(params[:id])
  end

  # POST /preorders
  # POST /preorders.json

  # PUT /preorders/1
  # PUT /preorders/1.json
  def update
    @preorder = Preorder.find(params[:id])

    respond_to do |format|
      if @preorder.update_attributes(params[:preorder])
        format.html { redirect_to @preorder, notice: 'Preorder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @preorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preorders/1
  # DELETE /preorders/1.json
  def destroy
    @preorder = Preorder.find(params[:id])
    @preorder.destroy

    respond_to do |format|
      format.html { redirect_to preorders_url }
      format.json { head :no_content }
    end
  end
end
