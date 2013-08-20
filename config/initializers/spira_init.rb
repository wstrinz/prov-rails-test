module Spira
  class Base
    def id
      new_record? ? nil : subject.to_s.gsub('http://','') #path.split(/\//).last
    end
  end
end

ev = PubliSci::DSL::Instance.new
ENABLE_EDIT = true
DSL_STRING = []
DSL_STRING[0] = IO.read(File.dirname(__FILE__) + "/primer-full.prov")
r = ev.instance_eval(DSL_STRING[0],File.dirname(__FILE__) + "/primer-full.prov")


# include PubliSci::Prov::DSL
# r = RDF::FourStore::Repository.new('http://localhost:8080/')
# r = ev.instance_eval do
#   configure do |config|
#     config.repository :fourstore
#   end
#   entity :datathing

#   activity :process, generated: :datathing

#   to_repository
# end

Spira.add_repository :default, r