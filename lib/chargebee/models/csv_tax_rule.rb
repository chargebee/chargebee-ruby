module ChargeBee
  class CsvTaxRule < Model

  attr_accessor :tax_profile_name, :country, :state, :zip_code, :zip_code_start, :zip_code_end,
  :tax1_name, :tax1_rate, :tax1_juris_type, :tax1_juris_name, :tax1_juris_code, :tax2_name, :tax2_rate,
  :tax2_juris_type, :tax2_juris_name, :tax2_juris_code, :tax3_name, :tax3_rate, :tax3_juris_type,
  :tax3_juris_name, :tax3_juris_code, :tax4_name, :tax4_rate, :tax4_juris_type, :tax4_juris_name,
  :tax4_juris_code, :status, :time_zone, :valid_from, :valid_till, :service_type, :rule_weight,
  :overwrite

  # OPERATIONS
  #-----------

  def self.create(params={}, env=nil, headers={})
    Request.send('post', uri_path("csv_tax_rules"), params, env, headers)
  end

  end # ~CsvTaxRule
end # ~ChargeBee