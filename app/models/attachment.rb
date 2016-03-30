class Attachment < ActiveRecord::Base
  belongs_to :entry

  has_attached_file :file, styles: { s_200: "200x200", s_400: "400x400" }

  do_not_validate_attachment_file_type :file
end
