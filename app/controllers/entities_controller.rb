class EntitiesController < ApplicationController
  # GET /entities
  # GET /entities.json
  def index
    @entities = Entity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entities }
    end
  end

  # GET /entities/1
  # GET /entities/1.json
  def show
    @entity = Entity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entity }
    end
  end

  # GET /entities/new
  # GET /entities/new.json
  def new
    @entity = RDF::URI("http://example.org/entity/#{Time.now.nsec.to_s(32)}").as(Entity)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entity }
    end
  end

  # GET /entities/1/edit
  def edit
    @entity = Entity.find(params[:id])
  end

  # POST /entities
  # POST /entities.json
  def create
    params[:entity]
    @entity = Entity.for(params[:entity]["subject"],params[:entity].except('subject'))

    respond_to do |format|
      if @entity.save
        format.html { redirect_to @entity, notice: 'Entity was successfully created.' }
        format.json { render json: @entity, status: :created, location: @entity }
      else
        format.html { render action: "new" }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entities/1
  # PUT /entities/1.json
  def update
    @entity = Entity.find(params[:id])

    respond_to do |format|
      if @entity.update_attributes(params[:entity].except("subject"))
        format.html { redirect_to @entity, notice: 'Entity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url }
      format.json { head :no_content }
    end
  end
end
