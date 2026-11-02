module ChargeBee
  class DraftRequest < Model

    class DraftRevision < Model
      attr_accessor :version, :created_at, :payload
    end

    class Validation < Model
      attr_accessor :category, :level, :message, :param_name, :type
    end

    class Execution < Model
      attr_accessor :status, :created_at, :result, :error_detail, :revision_version
    end

  attr_accessor :id, :path_param, :request_uri, :operation_id, :status, :executed_at, :created_at,
  :resource_version, :updated_at, :current_revision, :validations, :has_comments, :has_citations,
  :executions

  # OPERATIONS
  #-----------

  end # ~DraftRequest
end # ~ChargeBee