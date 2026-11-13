module ChargeBee
  class OrganizationDetail < Model

  attr_accessor :id, :organization_name, :email, :address_line1, :address_line2, :address_line3,
  :city, :state_code, :state, :country_code, :zip, :phone, :fax, :website, :is_vat_number_present,
  :vat_number, :resource_version, :updated_at, :business_entity_id

  # OPERATIONS
  #-----------

  def self.create(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {
        :isIdempotent => true
      }
    Request.send('post', uri_path("organization_details"), params, env, headers,nil, false, jsonKeys, options, "organizationDetail", "create")
  end

  def self.retrieve(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("organization_details",id.to_s), {}, env, headers,nil, false, jsonKeys, options, "organizationDetail", "retrieve")
  end

  def self.list(params={}, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send_list_request('get', uri_path("organization_details"), params, env, headers,nil, false, jsonKeys, options, "organizationDetail", "list")
  end

  end # ~OrganizationDetail
end # ~ChargeBee