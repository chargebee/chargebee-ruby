module ChargeBee
  class PersonalizedOffer < Model

    class Content < Model
      attr_accessor :title, :description
    end

    class Option < Model
      attr_accessor :id, :label, :processing_type, :processing_layout, :redirect_url
    end

  attr_accessor :id, :offer_id, :content, :options

  # OPERATIONS
  #-----------

  def self.personalized_offers(params, env=nil, headers={})
    jsonKeys = { 
        :custom => 0,
    }
    options = {}
    Request.send('post', uri_path("personalized_offers"), params, env, headers, "grow", true, jsonKeys, options)
  end

  end # ~PersonalizedOffer
end # ~ChargeBee