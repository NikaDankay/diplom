class Document < ApplicationRecord
# include AttachmentUploader[:attachment]
# validates :body, presence: true, unless: :attachment_data
def attachment_name=(name)
    @attachment_name = name
end

def attachment_name
    @attachment_name
end
end
