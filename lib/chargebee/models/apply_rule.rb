module ChargeBee
  class ApplyRule < Model

    class Rule < Model
      attr_accessor :id, :version, :name, :description, :evaluation_result, :error_message, :actions
    end

  attr_accessor :evaluate, :rule_id, :ruleset_id, :skip_failed_rules, :structured_expression,
  :context, :rules

  # OPERATIONS
  #-----------

  end # ~ApplyRule
end # ~ChargeBee