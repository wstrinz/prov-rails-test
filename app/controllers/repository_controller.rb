class RepositoryController < ApplicationController
  def query
    @query = params["query"].to_s
    @query = "SELECT * WHERE {?s ?p ?o} LIMIT 10" if @query.size == 0
    @response = SPARQL.execute(@query,Spira.repositories.first.last).to_h
    # @prett_response = @response.to_h.map{|s| Hash[s.map{|k,v| [k,v.to_s] }]}
    respond_to do |format|
      format.html
      format.json { render json: @response }
    end
  end

  def index
    @repo = Spira.repositories.first.last
    respond_to do |format|
      format.html
      # format.json { render json: @response }
    end
  end

  def dump
    @repo = Spira.repositories.first.last
    @statements = @repo.to_ttl
    respond_to do |format|
      format.html
      format.json { render json: @statements }
    end
  end
end
