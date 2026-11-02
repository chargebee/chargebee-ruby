module ChargeBee
  class EmailMessage < Model

    class Attachment < Model
      attr_accessor :id, :email_message_id, :file_name, :content_type, :size_bytes, :content_disposition, :created_at, :updated_at, :resource_version
    end

  attr_accessor :id, :email_conversation_id, :message_type, :author_type, :send_status, :content_html,
  :content_text, :created_at, :updated_at, :resource_version, :mailbox_id, :author_id, :author_name,
  :from_email, :to_emails, :cc_emails, :attachments

  # OPERATIONS
  #-----------

  end # ~EmailMessage
end # ~ChargeBee