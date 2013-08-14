class DataController < ApplicationController
  def dataset
    # TODO move this into a model on first refactor
    id = params[:id]
    output_format = params[:output_format]

    prov = RDF::Vocabulary.new('http://www.w3.org/ns/prov#')
    qb = RDF::Vocabulary.new('http://purl.org/linked-data/cube#')
    sio = RDF::Vocabulary.new('http://semanticscience.org/resource/')

    type_query = RDF::Query.new do
      pattern [RDF::URI('http://' + id), RDF.type, :type]
    end

    value_query = RDF::Query.new do
      pattern [RDF::URI('http://' + id), sio.hasValue, :value]
    end

    types = type_query.execute(Spira.repositories[:default]).map{|t| t[:type]}
    value = value_query.execute(Spira.repositories[:default]).map{|t| t[:value]}

    if types.include? qb.dataSet
      @data = PubliSci::ORM::DataSet.for(id)
      # use classes from bio-publisci/datacube_model.rb
    end

    if value.first
      @data = value.first.to_s
    end

    if output_format == :csv
      writer = PubliSci::Writer::CSV.new
      @data =
    elsif output_format == :ttl
      raise "Turtle output not implemented"
    else
    end

    # maybe check if the entity is a named graph and do something about that
    #
    # otherwise maybe dereference url? Other representation methods?

    respond_to do |format|
      format.html
      format.json { render json: @data }
    end
  end

  def metadata
    # could probably make model classes for this
    #  ? Dynamically??
    # But should probably create one in the gem
  end
end
