class RepositoryController < ApplicationController
  def query
    @query = params["query"].to_s || "SELECT * WHERE {?s ?p ?o} LIMIT 10"
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
end
