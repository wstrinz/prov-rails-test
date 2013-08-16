# class Association < ActiveRecord::Base
#   attr_accessible :agent, :hadPlan, :label
# end
class Association < PubliSci::Prov::Model::Association
  configure :base_uri => "http://"
end