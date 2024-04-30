module ChargeBee
  class Session < Model

  attr_accessor :id, :created_at, :expires_at

  class Content < Result
  end

  def content
    if @values[:content].nil?
        nil
    else
        Content.new(@values[:content])
    end
  end

  # OPERATIONS
  #-----------

  def self.create(params={}, env=nil, headers={})
    Request.send('post', uri_path("sessions"), params, env, headers)
  end

  def self.retrieve(id, params={}, env=nil, headers={})
    Request.send('get', uri_path("sessions",id.to_s), params, env, headers)
  end

  end # ~Session
end # ~ChargeBee