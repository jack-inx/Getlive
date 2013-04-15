class AttachedFile < ActiveRecord::Base
  belongs_to :attachment, :polymorphic => true
  has_attached_file :dumpfile
  
end
