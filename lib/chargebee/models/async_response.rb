module ChargeBee
  class AsyncResponse < Model

    class RequestAsyncApi < Model
      attr_accessor :id, :resource, :operation_type, :method, :uri, :idempotency_key
    end

    class Error < Model
      attr_accessor :message, :type, :api_error_code, :error_code, :error_msg, :http_status_code
    end

  attr_accessor :api_version, :created_at, :completed_at, :status, :request, :error_detail, :result

  # OPERATIONS
  #-----------

  end # ~AsyncResponse
end # ~ChargeBee