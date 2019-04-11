module ChargeBee
  class SiteMigrationDetail < Model

  attr_accessor :entity_id, :other_site_name, :entity_id_at_other_site, :migrated_at, :entity_type,
  :status

  # OPERATIONS
  #-----------

  def self.list(params={}, env=nil, headers={})
    Request.send_list_request('get', uri_path("site_migration_details"), params, env, headers)
  end

  end # ~SiteMigrationDetail
end # ~ChargeBee