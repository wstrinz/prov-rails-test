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
    value_results = value_query.execute(Spira.repositories[:default]).map{|t| t[:value]}
    # raise "#{qb.dataSet.to_s},  #{types.first.to_s}"

    if types.include? qb.DataSet
      @data = PubliSci::ORM::DataSet.for('http://' + id)
      # use classes from bio-publisci/datacube_model.rb
      if output_format == 'csv'
        writer = PubliSci::Writers::CSV.new
        @data = writer.from_store(Spira.repositories[:default],'http://' + id)
      elsif output_format == 'arff'
        writer = PubliSci::Writers::ARFF.new
        @data = writer.from_store(Spira.repositories[:default],'http://' + id)
      elsif output_format == 'ttl'
        raise "Data Cube turtle output not implemented"
      else
        raise "No Data Cube Writer for #{output_format}, #{output_format.class}"
      end
    elsif value_results.first
      @data = value_results.first.to_s
    elsif output_format == 'ttl'
      raise "Turtle output not implemented"
    else
      # this should probably return some value instead of raising an error
      # so page can report that no data exists.
      # Or say not found and just try dereferencing link?
      raise "UnknownDataset #{id}"
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
    @model = PubliSci::Metadata::Model::Meta.for('http://'+ params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @model }
    end
    # could probably make model classes for this
    #  ? Dynamically??
    # But should probably create one in the gem
  end
end
