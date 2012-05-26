class PartsImage < ActiveRecord::Base
  mount_uploader :part_image, CommonAssetUploader
end
