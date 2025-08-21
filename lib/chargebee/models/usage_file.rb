module ChargeBee
  class UsageFile < Model

    class UploadDetail < Model
      attr_accessor :url, :expires_at
    end

  attr_accessor :id, :name, :mime_type, :error_code, :error_reason, :status, :total_records_count,
  :processed_records_count, :failed_records_count, :file_size_in_bytes, :processing_started_at,
  :processing_completed_at, :uploaded_by, :uploaded_at, :upload_details

  # OPERATIONS
  #-----------

  def self.upload_url(params, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('post', uri_path("usage_files","upload_url"), params, env, headers, "file-ingest", false, jsonKeys, options)
  end

  def self.processing_status(id, env=nil, headers={})
    jsonKeys = { 
    }
    options = {}
    Request.send('get', uri_path("usage_files",id.to_s,"processing_status"), {}, env, headers, "file-ingest", false, jsonKeys, options)
  end

  end # ~UsageFile
end # ~ChargeBee