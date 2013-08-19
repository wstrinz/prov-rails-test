class DslController < ApplicationController
  def show
    @dsl_text = DSL_STRING[0]
    puts @dsl_text

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dsl_text }
    end
  end

  def edit
    redirect_to dsl_show_path unless ENABLE_EDIT
    @dsl_text = DSL_STRING[0]
  end

  def update
    # TODO move this to main gem, under some kind of update function
    redirect_to dsl_show_path unless ENABLE_EDIT
    new_str = params[:new_dsl]
    ev = PubliSci::DSL::Instance.new
    begin
      r = ev.instance_eval(new_str,File.dirname(__FILE__) + "/primer-full.prov")
    rescue
      raise "Caught error in eval"
    end

    Spira.add_repository :default, r

    DSL_STRING[0] = new_str
    redirect_to dsl_show_path
  end
end
