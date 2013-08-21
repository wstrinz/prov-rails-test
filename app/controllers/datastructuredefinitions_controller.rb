class DatastructuredefinitionsController < ApplicationController
  # GET /datastructuredefinitions
  # GET /datastructuredefinitions.json
  def index
    @datastructuredefinitions = Datastructuredefinition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @datastructuredefinitions }
    end
  end

  # GET /datastructuredefinitions/1
  # GET /datastructuredefinitions/1.json
  def show
    @datastructuredefinition = Datastructuredefinition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @datastructuredefinition }
    end
  end

  # GET /datastructuredefinitions/new
  # GET /datastructuredefinitions/new.json
  def new
    @datastructuredefinition = Datastructuredefinition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @datastructuredefinition }
    end
  end

  # GET /datastructuredefinitions/1/edit
  def edit
    @datastructuredefinition = Datastructuredefinition.find(params[:id])
  end

  # POST /datastructuredefinitions
  # POST /datastructuredefinitions.json
  def create
    @datastructuredefinition = Datastructuredefinition.new(params[:datastructuredefinition])

    respond_to do |format|
      if @datastructuredefinition.save
        format.html { redirect_to @datastructuredefinition, notice: 'Datastructuredefinition was successfully created.' }
        format.json { render json: @datastructuredefinition, status: :created, location: @datastructuredefinition }
      else
        format.html { render action: "new" }
        format.json { render json: @datastructuredefinition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /datastructuredefinitions/1
  # PUT /datastructuredefinitions/1.json
  def update
    @datastructuredefinition = Datastructuredefinition.find(params[:id])

    respond_to do |format|
      if @datastructuredefinition.update_attributes(params[:datastructuredefinition])
        format.html { redirect_to @datastructuredefinition, notice: 'Datastructuredefinition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datastructuredefinition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datastructuredefinitions/1
  # DELETE /datastructuredefinitions/1.json
  def destroy
    @datastructuredefinition = Datastructuredefinition.find(params[:id])
    @datastructuredefinition.destroy

    respond_to do |format|
      format.html { redirect_to datastructuredefinitions_url }
      format.json { head :no_content }
    end
  end
end
