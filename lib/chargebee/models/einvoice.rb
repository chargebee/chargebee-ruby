module ChargeBee
  class Einvoice < Model

    class Artifact < Model
      attr_accessor :artifact_type, :direction, :status, :code, :external_artifact_id, :created_at, :resource_version, :updated_at, :deleted
    end

  attr_accessor :id, :entity_type, :entity_id, :reference_id, :reference_number, :status, :message,
  :created_at, :resource_version, :updated_at, :deleted, :provider_references, :business_entity_id,
  :artifacts

  # OPERATIONS
  #-----------

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("einvoices",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "einvoice", "retrieve")
  end

  def self.list_einvoices(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("einvoices"), params, env, headers,nil, false, jsonKeys, options, "einvoice", "listEinvoices")
  end

  end # ~Einvoice
end # ~ChargeBee